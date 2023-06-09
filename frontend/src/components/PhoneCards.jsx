import React from "react";
import PropTypes from "prop-types";

function PhoneCards({
  brand,
  ram,
  storage,
  url,
  network,
  model,
  screen,
  antutu,
  category,
}) {
  const categories = [
    { category: "1 - HC", color: "text-lime-500" },
    { category: "2 - C", color: "text-blue-500" },
    { category: "3 - B", color: "text-yellow-500" },
    { category: "4 - A", color: "text-orange-500" },
    { category: "5 - PREMIUM", color: "text-red-500" },
  ];
  const handleColor = () => {
    const color = categories.find((elem) => elem.category === category);
    return color ? color.color : "text-black";
  };
  return (
    <div className="shadow p-4 rounded-lg bg-white">
      <div className="relative inline-block duration-300 ease-in-out transition-transform transform hover:-translate-y-2 w-full">
        <div className="flex justify-center relative rounded-lg overflow-hidden h-90">
          <div className="transition-transform duration-500 transform ease-in-out hover:scale-110 w-full">
            <img src={url} alt="Descripción de la imagen" />
            <div className="absolute inset-0 bg-black opacity-10" />
          </div>

          <div className="absolute flex justify-center bottom-0 mb-3">
            <div className="flex bg-white px-4 py-1 space-x-5 rounded-lg overflow-hidden shadow">
              <p className="flex items-center font-medium text-gray-800">
                {network}
              </p>

              <p className="flex items-center font-medium text-gray-800">
                {screen}"
              </p>

              <p className="flex items-center font-medium text-gray-800">LCD</p>
            </div>
          </div>

          <span className="absolute top-0 left-0 inline-flex mt-3 ml-3 px-3 py-2 rounded-lg z-10 bg-green text-sm font-medium text-white select-none">
            Disponible
          </span>
        </div>

        <div className="text-center block mt-4">
          <h2
            className="font-medium text-base md:text-lg text-gray-800 line-clamp-1"
            title="New York"
          >
            {brand} {model}
          </h2>
          <p
            className={`mt-2 text-sm text-cyan-500 line-clamp-1 ${handleColor()}`}
            title="New York, NY 10004, United States"
          >
            Catégorie {category}
          </p>
        </div>

        <div className="mt-8">
          <p className="block text-gray-800">
            <span className="block mt-2 xl:mt-0">RAM: {ram} Go</span>
          </p>
          <p className="inline-flex flex-col xl:flex-row xl:items-center text-gray-800">
            <span className="block mt-2 xl:mt-0">Stockage: {storage} Go</span>
          </p>
          <p className="block text-gray-800">
            <span className="block mt-2 xl:mt-0">Score antutu: {antutu}</span>
          </p>
        </div>

        <div className="grid grid-cols-2 mt-8">
          <div className="flex items-center">
            <button
              type="button"
              className="bg-main hover:bg-main-light text-white py-2 px-4 rounded-full "
            >
              Voir plus
            </button>
          </div>

          <div className="flex justify-end">
            <p className="inline-block font-semibold text-primary whitespace-nowrap leading-tight rounded-xl">
              <span className="text-sm uppercase">$</span>
              <span className="text-lg">79</span>€
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}

PhoneCards.propTypes = {
  brand: PropTypes.string.isRequired,
  ram: PropTypes.number.isRequired,
  storage: PropTypes.number.isRequired,
  url: PropTypes.string.isRequired,
  network: PropTypes.string.isRequired,
  model: PropTypes.string.isRequired,
  screen: PropTypes.number.isRequired,
  antutu: PropTypes.number.isRequired,
  category: PropTypes.string.isRequired,
};

export default PhoneCards;
