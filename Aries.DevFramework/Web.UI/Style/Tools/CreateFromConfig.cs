using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web.Core
{
    public class CreateFromConfig : CYQ.Data.Orm.OrmBase
    {
        public CreateFromConfig()
        {
            base.SetInit(this, "CreateFromConfig", "txt path={0}\\Tools;ts=0");
        }
        public int ID { get; set; }
        /// <summary>
        /// 表名
        /// </summary>
        public string TbName { get; set; }
        /// <summary>
        /// 字段名
        /// </summary>
        public string Field { get; set; }
        /// <summary>
        /// 标题、说明
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 操作类型
        /// </summary>
        public string DescripType { get; set; }

        /// <summary>
        /// 是否允许为空
        /// </summary>
        public bool IsCanNull { get; set; }

        /// <summary>
        /// 是否隐藏
        /// </summary>
        public bool Sortable { get; set; }

        /// <summary>
        /// 下拉框说明
        /// </summary>
        public string ViewName { get; set; }
        //public int Rowspan { get; set; }
        //public int WordLength { get; set; }
        //public int WordHeight { get; set; }

        /// <summary>
        /// 是否只读
        /// </summary>
        public bool IsRead { get; set; }

        /// <summary>
        /// 正则表达式
        /// </summary>
        public string Validtype { get; set; }

        /// <summary>
        /// 样式
        /// </summary>
        public string Style { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        public int OrderNum { get; set; }

    }
}
