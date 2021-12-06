using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace AxaProje.Data.Models
{
    public partial class AxaProjeDBContext : DbContext
    {
        public AxaProjeDBContext()
        {
        }

        public AxaProjeDBContext(DbContextOptions<AxaProjeDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ActionLog> ActionLogs { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<CustomerCategory> CustomerCategories { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {

                optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS01;Database=AxaProjeDB;User Id=sa; Password=Password1;MultipleActiveResultSets=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ActionLog>(entity =>
            {
                entity.ToTable("ActionLog");

                entity.Property(e => e.Date).HasColumnType("datetime");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.ToTable("Customer");

                entity.HasOne(d => d.CostumerCategories)
                    .WithMany(p => p.Customers)
                    .HasForeignKey(d => d.CostumerCategoriesId)
                    .HasConstraintName("FK_Customer_Customer");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.Password).HasMaxLength(50);

                entity.Property(e => e.UserName).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
