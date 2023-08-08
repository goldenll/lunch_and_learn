# Lunch and Learn

## Project Description

You are a back-end developer working on a team that is building an application to search for cuisines by country and provide an opportunity to learn more about that country's culture. This app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API to satisfy the front-end team’s requirements.

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Implement Basic Authentication
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Resources

**Edamam API** key and application ID: [Edamam Recipe API](https://developer.edamam.com/edamam-recipe-api)
- API endpoint: "https://api.edamam.com/api/recipes/v2?type=public&q=#{country}"

**REST Countries API**: [REST Countries API](https://restcountries.com/#api-endpoints-v3-all) (no API key required)
- API endpoint: "https://restcountries.com/v3.1/all"

**YouTube API** key: [YouTube API](https://developer.edamam.com/edamam-recipe-api)
- API endpoint: "https://www.googleapis.com/youtube/v3/search"

**Unsplash API** key: [Unsplash API](https://unsplash.com/documentation#creating-a-developer-account)
- API endpoint: "https://api.unsplash.com/search/photos"

**User Registration endpoint**: `POST /api/v1/users`
**User Log In endpoint**: `POST /api/v1/sessions`
**Add Favorite Recipes endpoint**: `POST /api/v1/favorites`
**Get User Favorites endpoint**: `GET /api/v1/favorites?api_key=<key>`
