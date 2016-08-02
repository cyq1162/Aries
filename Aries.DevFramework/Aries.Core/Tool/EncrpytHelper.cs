using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Security;
using System.Security.Cryptography;
using CYQ.Data;

namespace Aries.Core
{
    /// <summary>
    /// 密码加密助手类
    /// </summary>
    public static class EncrpytHelper
    {
        #region
        private static string EncrpytKey
        {
            get
            {
                return AppConfig.GetApp("EncrpytKey", "!1@2#3$4%5^6");
            }
        }

        /// <summary>
        /// 3des加密字符串
        /// </summary>
        /// <param name="text">要加密的字符串</param>
        /// <returns>加密后并经base64编码的字符串</returns>
        /// <remarks>静态方法，采用默认ascii编码</remarks>
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
        public static string Encrypt(string text, string key)
        {
            TripleDESCryptoServiceProvider DES = new
                TripleDESCryptoServiceProvider();
            MD5CryptoServiceProvider hashMD5 = new MD5CryptoServiceProvider();

            DES.Key = hashMD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(key));
            DES.Mode = CipherMode.ECB;

            ICryptoTransform DESEncrypt = DES.CreateEncryptor();

            byte[] Buffer = ASCIIEncoding.UTF8.GetBytes(text);
            string pass= Convert.ToBase64String(DESEncrypt.TransformFinalBlock
                (Buffer, 0, Buffer.Length));
            return pass.Replace('=', '#');
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
                return string.Empty;
            else
            {
                text = text.Trim().Replace(' ', '+');//处理Request的+号变空格问题。
                return Decrypt(text, EncrpytKey);
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
        public static string Decrypt(string text, string key)
        {
            text = text.Replace('#', '=');
            TripleDESCryptoServiceProvider DES = new
                TripleDESCryptoServiceProvider();
            MD5CryptoServiceProvider hashMD5 = new MD5CryptoServiceProvider();

            DES.Key = hashMD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(key));
            DES.Mode = CipherMode.ECB;

            ICryptoTransform DESDecrypt = DES.CreateDecryptor();

            string result = "";
            try
            {
                byte[] Buffer = Convert.FromBase64String(text);
                result = ASCIIEncoding.UTF8.GetString(DESDecrypt.TransformFinalBlock
                    (Buffer, 0, Buffer.Length));
            }
            catch
            {
                return text;
            }

            return result;
        }

        #endregion
    }
}
