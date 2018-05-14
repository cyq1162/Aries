using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Aries.Core.Extend
{
    /// <summary>
    /// 文件类扩展方法
    /// </summary>
    public static class FileExtend
    {
        /// <summary>
        /// 先自动识别UTF8，否则归到Default编码读取
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public static string ReadAllText(string path)
        {
            Byte[] buff = File.ReadAllBytes(path);
            if (buff.Length == 0) { return ""; }
            if (buff[0] == 239 && buff[1] == 187 && buff[2] == 191)
            {
                return Encoding.UTF8.GetString(buff, 3, buff.Length - 3);
            }
            else if (buff[0] == 255 && buff[1] == 254)
            {
                return Encoding.Unicode.GetString(buff, 2, buff.Length - 2);
            }
            else if (buff[0] == 254 && buff[1] == 255)
            {
                return Encoding.BigEndianUnicode.GetString(buff, 2, buff.Length - 2);
            }
            return Encoding.Default.GetString(buff);
        }
    }
}
