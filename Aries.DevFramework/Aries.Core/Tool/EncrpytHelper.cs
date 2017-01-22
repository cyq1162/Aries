using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Security;
using System.Security.Cryptography;
using CYQ.Data;

namespace Aries.Core.Helper
{
    /// <summary>
    /// 密码加密助手类
    /// </summary>
    public static class EncrpytHelper
    {
        private static byte[] GetHash(string key)
        {
            using (MD5CryptoServiceProvider hashMD5 = new MD5CryptoServiceProvider())
            {
                return hashMD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(key));
            }
        }
        private static byte[] _DefaultHashKey;
        private static byte[] DefaultHashKey
        {
            get
            {
                if (_DefaultHashKey == null)
                {
                    _DefaultHashKey = GetHash("!1@2#3$4%5^6");
                }
                return _DefaultHashKey;
            }
        }
        /// <summary>
        /// 预留的二次加密
        /// </summary>
        private static string EncrpytKey
        {
            get
            {
                return AppConfig.GetApp("EncrpytKey", "");
            }
        }
        #region
        public static string Encrypt(string text)
        {
            return Encrypt(text, EncrpytKey);
        }
        /// <summary>
        /// 3des加密字符串
        /// </summary>
        /// <param name="text">要加密的字符串</param>
        /// <param name="key">密钥</param>
        /// <returns>加密后并经base64编码的字符串</returns>
        /// <remarks>静态方法，采用默认ascii编码</remarks>
        private static string Encrypt(string text, string key)
        {
            string result = string.Empty;
            using (TripleDESCryptoServiceProvider DES = new TripleDESCryptoServiceProvider())
            {
                if (string.IsNullOrEmpty(key))
                {
                    DES.Key = DefaultHashKey;
                }
                else
                {
                    DES.Key = GetHash(key);
                }
                DES.Mode = CipherMode.ECB;
                ICryptoTransform DESEncrypt = DES.CreateEncryptor();

                byte[] Buffer = ASCIIEncoding.UTF8.GetBytes(text);
                string pass = Convert.ToBase64String(DESEncrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));
                result = pass.Replace('=', '#');
                if (string.IsNullOrEmpty(key))
                {
                    if (EncrpytKey != "")
                    {
                        return Encrypt(result, EncrpytKey);//二次加密
                    }
                }
                else
                {
                    result = result + "=2";//二次加密的追加后缀
                }
            }

            return result;
        }//end method


        /// <summary>
        /// 3des解密字符串
        /// </summary>
        /// <param name="text">要解密的字符串</param>
        /// <returns>解密后的字符串</returns>
        /// <exception cref="">密钥错误</exception>
        /// <remarks>静态方法，采用默认ascii编码</remarks>
        public static string Decrypt(string text)
        {
            if (string.IsNullOrEmpty(text))
            {
                return string.Empty;
            }
            else
            {
                text = text.Trim().Replace(' ', '+');//处理Request的+号变空格问题。
                if (EncrpytKey != "" && text.EndsWith("=2"))
                {
                    text = Decrypt(text.Substring(0, text.Length - 2), GetHash(EncrpytKey));//先解一次Key
                }
                return Decrypt(text, DefaultHashKey);
            }
        }//end method


        /// <summary>
        /// 3des解密字符串
        /// </summary>
        /// <param name="text">要解密的字符串</param>
        /// <param name="key">密钥</param>
        /// <returns>解密后的字符串</returns>
        /// <exception cref="">密钥错误</exception>
        /// <remarks>静态方法，采用默认ascii编码</remarks>
        private static string Decrypt(string text, byte[] hashKey)
        {
            string result = "";
            text = text.Replace('#', '=');
            using (TripleDESCryptoServiceProvider DES = new TripleDESCryptoServiceProvider())
            {
                DES.Key = hashKey;
                DES.Mode = CipherMode.ECB;

                ICryptoTransform DESDecrypt = DES.CreateDecryptor();
                try
                {
                    byte[] Buffer = Convert.FromBase64String(text);
                    result = ASCIIEncoding.UTF8.GetString(DESDecrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));
                }
                catch
                {
                    return text;
                }
            }
            return result;
        }

        #endregion
    }
}
