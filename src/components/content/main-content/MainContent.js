import React, { useState } from 'react';
import './MainContent.scss';
import Slideshow from '../slide-show/Slideshow';
import Paginate from '../paginate/Paginate';

const MainContent = () => {
  const images = [
    {
      url: 'https://empire-s3-production.bobvila.com/slides/22160/original/carmel-california.jpg?1591225469'
    },
    {
      url: 'https://explo-re.com/wp-content/uploads/2017/05/Carmel-By-The-Sea-California-696x461.jpg'
    },
    {
      url: 'https://livingnomads.com/wp-content/uploads/2016/07/Bibury-most-beautiful-charming-ancient-village-in-England-the-world-photos-photography-uk-6.jpg'
    },
    {
      url: 'https://media.cntraveler.com/photos/611517ea423da55ea76063f6/master/w_4000,h_2667,c_limit/eureka-springs-arkansas-GettyImages-1327311498.jpg'
    }
  ];

  const [currentPage, setCurrentPage] = useState(1);

  const paginate = (type) => {
    if (type === 'prev' && currentPage > 1) {
      setCurrentPage((prev) => prev - 1);
    } else {
      setCurrentPage((prev) => prev + 1);
    }
  };

  return (
    <div className="main-content">
      <Slideshow images={images} auto={true} showArrows={true} />
      <div className="grid-movie-title">
        <div className="movieType">Now Playing</div>
        <div className="paginate">
          <Paginate currentPage={currentPage} totalPages={10} paginate={paginate} />
        </div>
      </div>
      {/* display grid component */}
    </div>
  );
};

export default MainContent;
