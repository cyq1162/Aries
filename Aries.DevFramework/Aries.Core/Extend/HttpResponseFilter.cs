using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using CYQ.Data;
using Aries.Core.Helper;
using Aries.Core.Config;

namespace Aries.Core.Extend
{
    /// <summary>
    /// 处理本项目部署成子应用程序时，多了一个目录的问题。
    /// </summary>
    public class HttpResponseFilter : Stream
    {
        Stream filterStream;
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="stream">参数为：HttpContext.Current.Response.Filter</param>
        /// <param name="replaceHtmlTextList">字典集合：key为被替换正则表达式,value为替换的字符串</param>
        public HttpResponseFilter(Stream stream)
        {
            filterStream = stream;
        }
        public override bool CanRead
        {
            get { return filterStream.CanRead; }
        }

        public override bool CanSeek
        {
            get { return filterStream.CanSeek; }
        }

        public override bool CanWrite
        {
            get { return filterStream.CanWrite; }
        }

        public override void Flush()
        {
            filterStream.Flush();
        }

        public override long Length
        {
            get { return filterStream.Length; }
        }

        public override long Position
        {
            get
            {
                return filterStream.Position;
            }
            set
            {
                filterStream.Position = value;
            }
        }

        public override int Read(byte[] buffer, int offset, int count)
        {
            return filterStream.Read(buffer, offset, count);
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            return filterStream.Seek(offset, origin);
        }

        public override void SetLength(long value)
        {
            filterStream.SetLength(value);
        }
        public override void Close()
        {
            filterStream.Close();
        }
        public override void Write(byte[] buffer, int offset, int count)
        {
            if (buffer.Length == 0) { return; }
            var ct = HttpContext.Current.Response.ContentType;
            if (ct.IndexOf("image", StringComparison.OrdinalIgnoreCase) != -1)//图片类型
            {
                filterStream.Write(buffer, offset, count);
                return;
            }
            byte[] newBytes = ReplaceText.Replace(buffer, offset, count);

            filterStream.Write(newBytes, 0, newBytes.Length);
        }
    }
    internal class ReplaceText
    {
        internal static byte[] Replace(byte[] buffer, int offset, int count)
        {
            //读出写的文字
            byte[] data = new byte[count];

            Buffer.BlockCopy(buffer, offset, data, 0, count);

            string html = Encoding.UTF8.GetString(data);
            //开始替换
            html = ReplaceHtml(html);

            //将替换后的写入response
            return Encoding.UTF8.GetBytes(html);
        }
        private static string ReplaceHtml(string html)
        {
            if (WebHelper.IsUseUISite)
            {
                string ui = AppConfig.GetApp("UI", string.Empty).ToLower();
                if (!string.IsNullOrEmpty(ui))
                {
                    html = html.Replace(" src=\"/", " src=\"" + ui + "/").Replace(" src = \"/", " src = \"" + ui + "/").Replace(" src = '/", " src = '/" + ui + "/").Replace(" src='/", " src ='/" + ui + "/"); ;
                    html = html.Replace(" href=\"/", " href=\"" + ui + "/").Replace(" href = \"/", " href = \"" + ui + "/").Replace(" href='/", " href='" + ui + "/").Replace(" href = '/", " href = '" + ui + "/");

                }
            }
            //替换标签
            if (html.IndexOf("${") > -1)
            {
                html = LangConst.ReplateHtmlLanguage(html);
            }
            return html;
        }

    }
}
