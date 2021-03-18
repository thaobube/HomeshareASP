using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeshareASP.Models
{
    public class LoginModel
    {
        private string _login, _password;


        #region Properties

        [Required]
        public string Login
        {
            get
            {
                return _login;
            }

            set
            {
                _login = value;
            }
        }

        [Required]
        public string Password
        {
            get
            {
                return _password;
            }

            set
            {
                _password = value;
            }
        }
        #endregion
    }
}
