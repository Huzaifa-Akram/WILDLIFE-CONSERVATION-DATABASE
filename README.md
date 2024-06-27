# WILDLIFE-CONSERVATION-DATABASE
This project contains SQL scripts to create and manage a database for tracking animal observations. The database includes two main tables: Animals and Observations, and a view ObservationDetails. Additionally, it includes a stored procedure GetObservationsByAnimal to retrieve observations for a specific animal.

Database Schema
Tables:

Animals: Stores information about animals, including their species, habitat, name, and age.
Observations: Stores observation records linked to animals, including the date and notes of each observation.
View:

ObservationDetails: A view combining animal names with their observation details for easy querying.
Stored Procedure:

GetObservationsByAnimal: Retrieves all observation records for a given animal by animal_id.
SQL Scripts
