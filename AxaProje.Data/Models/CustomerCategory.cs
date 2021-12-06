using System;
using System.Collections.Generic;

#nullable disable

namespace AxaProje.Data.Models
{
    public partial class CustomerCategory
    {
        public CustomerCategory()
        {
            Customers = new HashSet<Customer>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Customer> Customers { get; set; }
    }
}
