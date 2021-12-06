using AxaProje.Core.Models;
using AxaProje.Data.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AxaProje.Core.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : Controller
    {
        private readonly AxaProjeDBContext _context;
        public UserController(AxaProjeDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ApiResponse Get()
        {

            try
            {
                var customerList = _context.Customers.Include(p => p.CostumerCategories).Select(p => new CustomerModel
                {
                    Id = p.Id,
                    Adress = p.Adress,
                    CategoriesId = p.CostumerCategories.Id,
                    CategoriesName = p.CostumerCategories.Name,
                    FullName = p.FullName

                }).ToList();

                var log = JsonConvert.SerializeObject(customerList);

                ActionLog logInfo = new ActionLog();
                logInfo.ActionInfo = "Müşter Listelendi";
                logInfo.AcLog = log;
                logInfo.Date = DateTime.Now;
                _context.ActionLogs.Add(logInfo);
                var result = _context.SaveChanges();

                return new ApiResponse { Code = 200, Message = "Başarılı", Set = customerList };
            }
            catch (Exception exc)
            {

                return new ApiResponse { Code = 500, Message = "Sunucu İç Hatası", Set = exc };
            }


        }

        [HttpGet("{id}")]
        public ApiResponse Get(int? id)
        {
            try
            {
                var Customer = _context.Customers.Include(p => p.CostumerCategories).Select(p => new CustomerModel
                {
                    Id = p.Id,
                    Adress = p.Adress,
                    CategoriesId = p.CostumerCategories.Id,
                    CategoriesName = p.CostumerCategories.Name,
                    FullName = p.FullName

                }).Where(p=>p.Id== id) ;

                return new ApiResponse { Code = 200, Message = "Başarılı", Set = Customer };
            }
            catch (Exception exc)
            {

                return new ApiResponse { Code = 500, Message = "Sunucu İç Hatası", Set = exc };
            }


        }

        [HttpPost]

        public ApiResponse Post(Customer customer)
        {
            try
            {
                _context.Customers.Add(customer);
                var result = _context.SaveChanges();

                var log = JsonConvert.SerializeObject(customer);

                ActionLog logInfo = new ActionLog();
                logInfo.ActionInfo = "Yeni Müşter eklendi";
                logInfo.AcLog = log;
                logInfo.Date = DateTime.Now;
                _context.ActionLogs.Add(logInfo);
                var result1 = _context.SaveChanges();


                return new ApiResponse { Code = 200, Message = "Başarılı", Set = customer };
            }
            catch (Exception exc)
            {
                return new ApiResponse { Code = 500, Message = "Sunucu İç Hatası", Set = exc };
            }

        }


        [HttpDelete]

        public ApiResponse Delete(int? id)
        {
            try
            {
                var silencekUrun = _context.Customers.FirstOrDefault(p => p.Id == id);
                _context.Customers.Remove(silencekUrun);
                var result = _context.SaveChanges();

                var log = JsonConvert.SerializeObject(silencekUrun);

                ActionLog logInfo = new ActionLog();
                logInfo.ActionInfo = " Müşter Silindi";
                logInfo.AcLog = log;
                logInfo.Date = DateTime.Now;
                _context.ActionLogs.Add(logInfo);
                var result1 = _context.SaveChanges();

                return new ApiResponse { Code = 200, Message = "Başarılı", Set = silencekUrun.Id };
            }
            catch (Exception exc)
            {
                return new ApiResponse { Code = 500, Message = "Sunucu İç Hatası", Set = exc };
            }


        }


        [HttpPut]

        public ApiResponse Update(Customer customer)
        {
            try
            {
                _context.Customers.Update(customer);
                var result = _context.SaveChanges();

                var log = JsonConvert.SerializeObject(customer);

                ActionLog logInfo = new ActionLog();
                logInfo.ActionInfo = " Müşter Düzenlendi";
                logInfo.AcLog = log;
                logInfo.Date = DateTime.Now;
                _context.ActionLogs.Add(logInfo);
                var result1 = _context.SaveChanges();
                return new ApiResponse { Code = 200, Message = "Başarılı", Set = customer };
            }
            catch (Exception exc)
            {
                return new ApiResponse { Code = 500, Message = "Sunucu İç Hatası", Set = exc };
            }

        }

    }
}
