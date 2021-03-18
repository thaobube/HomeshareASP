using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeshareASP.Models
{
    public class HomeViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private List<BienModel> _featuredBannerBien;
        private List<BienModel> _featuredBestBien;
        private List<BienModel> _featuredNewestBien;

        #region Properties
        public List<BienModel> FeaturedBannerBien
        {
            get
            {
                return _featuredBannerBien;
            }

            set
            {
                _featuredBannerBien = value;
            }
        }

        public List<BienModel> FeaturedBestBien
        {
            get
            {
                return _featuredBestBien;
            }

            set
            {
                _featuredBestBien = value;
            }
        }

        public List<BienModel> FeaturedNewestBien
        {
            get
            {
                return _featuredNewestBien;
            }

            set
            {
                _featuredNewestBien = value;
            }
        }
        #endregion

        public HomeViewModel()
        {
            // Home Banner Slider - Random Bien
            FeaturedBannerBien = uow.GetFeaturedBienModel(5);

            // Best Biens - with the highest notes


        }
    }
}