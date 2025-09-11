using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionUsuarios.Entities
{
    public class Users
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public bool ConfirmedEmail { get; set; }
        public bool Active { get; set; }
        public DateTime Creation {  get; set; }
        public DateTime LastAccess { get; set; }
    }
}