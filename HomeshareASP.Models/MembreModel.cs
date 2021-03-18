using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeshareASP.Models
{
    public class MembreModel
    {
        #region Fields
        private int _idMembre;
        private string _nom;
        private string _prenom;
        private string _email;
        private string _telephone;
        private string _login;
        private string _password;
        private string __confirmPassword;
        private int _pays;
        #endregion

        #region Properties
        public int IdMembre
        {
            get
            {
                return _idMembre;
            }

            set
            {
                _idMembre = value;
            }
        }
        [Required]
        [MaxLength(50)]
        public string Nom
        {
            get
            {
                return _nom;
            }

            set
            {
                _nom = value;
            }
        }
        
        [Required]
        [MaxLength(50)]
        public string Prenom
        {
            get
            {
                return _prenom;
            }

            set
            {
                _prenom = value;
            }
        }

        public string Email
        {
            get
            {
                return _email;
            }

            set
            {
                _email = value;
            }
        }

        public string Telephone
        {
            get
            {
                return _telephone;
            }

            set
            {
                _telephone = value;
            }
        }

        [Required]
        [MaxLength(50)]
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


        [Required]
        [Compare("Password", ErrorMessage = "No Matching Password")]
        public string ConfirmPassword
        {
            get
            {
                return __confirmPassword;
            }

            set
            {
                __confirmPassword = value;
            }
        }

        public int Pays
        {
            get
            {
                return _pays;
            }

            set
            {
                _pays = value;
            }
        } 
        #endregion


    }
}
