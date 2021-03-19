using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeshareASP.Models
{
    public class HomesharingViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private List<BienModel> _allBienList;
        private int _maxBien, _maxPage;

        public HomesharingViewModel()
        {
            MaxBien = uow.CountAllBien();
            if ((MaxBien % 3) == 0)
            {
                MaxPage = MaxBien / 3;
            }
            else
            {
                double nbPage = MaxBien / 3;
                MaxPage = (int)Math.Floor(nbPage) + 1;
            }
        }

        public void paginateHomesharing(string searchString = null, int page = 1)
        {
            // Section Classes
            AllBienList = uow.GetBienModelByPage(searchString, page);
            if (searchString != null)
            {

                MaxBien = uow.CountAllBienAllPage(searchString, page);
                if ((MaxBien % 3) == 0)
                {
                    MaxPage = MaxBien / 3;
                }
                else
                {
                    double nbPage = MaxBien / 3;
                    MaxPage = (int)Math.Floor(nbPage) + 1;
                }
            }
        }

        #region Properties
        public List<BienModel> AllBienList
        {
            get
            {
                return _allBienList;
            }

            set
            {
                _allBienList = value;
            }
        }

        public int MaxBien
        {
            get
            {
                return _maxBien;
            }

            set
            {
                _maxBien = value;
            }
        }

        public int MaxPage
        {
            get
            {
                return _maxPage;
            }

            set
            {
                _maxPage = value;
            }
        } 
        #endregion
    }
}