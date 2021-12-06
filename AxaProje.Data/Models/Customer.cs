using System;
using System.Collections.Generic;

#nullable disable

namespace AxaProje.Data.Models
{
    public partial class Customer
    {
        public int Id { get; set; }
        public int? CostumerCategoriesId { get; set; }
        public string Adress { get; set; }
        public string FullName { get; set; }

        public virtual CustomerCategory CostumerCategories { get; set; }
    }
}
