-- Creating the Database
CREATE DATABASE WildlifeConservation;

-- Use the Database
USE WildlifeConservation;

-- Creating Species Table
CREATE TABLE Species (
    species_id INT PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    conservation_status VARCHAR(50)
);

-- Creating Habitats Table
CREATE TABLE Habitats (
    habitat_id INT PRIMARY KEY,
    habitat_name VARCHAR(100),
    location VARCHAR(100)
);

-- Creating Animals Table
CREATE TABLE Animals (
    animal_id INT PRIMARY KEY,
    species_id INT,
    habitat_id INT,
    name VARCHAR(100),
    age INT,
    FOREIGN KEY (species_id) REFERENCES Species(species_id),
    FOREIGN KEY (habitat_id) REFERENCES Habitats(habitat_id)
);

-- Creating Observations Table
CREATE TABLE Observations (
    observation_id INT PRIMARY KEY,
    animal_id INT,
    observation_date DATE,
    notes TEXT,
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id)
);

-- Creating Volunteers Table
CREATE TABLE Volunteers (
    volunteer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Creating ConservationActivity Table
CREATE TABLE ConservationActivity (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(100),
    description TEXT
);

-- Creating VolunteerActivity Table
CREATE TABLE VolunteerActivity (
    volunteer_id INT,
    activity_id INT,
    date DATE,
    hours INT,
    PRIMARY KEY (volunteer_id, activity_id),
    FOREIGN KEY (volunteer_id) REFERENCES Volunteers(volunteer_id),
    FOREIGN KEY (activity_id) REFERENCES ConservationActivity(activity_id)
);

-- Creating Equipment Table
CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(100),
    description TEXT
);

-- Creating ActivityEquipment Table
CREATE TABLE ActivityEquipment (
    activity_id INT,
    equipment_id INT,
    quantity INT,
    PRIMARY KEY (activity_id, equipment_id),
    FOREIGN KEY (activity_id) REFERENCES ConservationActivity(activity_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

-- Creating SpeciesThreats Table
CREATE TABLE SpeciesThreats (
    threat_id INT PRIMARY KEY,
    threat_name VARCHAR(100),
    description TEXT
);

-- Creating Funding Table
CREATE TABLE Funding (
    funding_id INT PRIMARY KEY,
    source VARCHAR(100),
    amount DECIMAL(10, 2),
    funding_date DATE
);

-- Inserting data into Species Table
INSERT INTO Species (species_id, common_name, scientific_name, conservation_status)
VALUES 
(1, 'African Elephant', 'Loxodonta africana', 'Vulnerable'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', 'Endangered'),
(3, 'Giant Panda', 'Ailuropoda melanoleuca', 'Vulnerable'),
(4, 'Snow Leopard', 'Panthera uncia', 'Vulnerable'),
(5, 'Blue Whale', 'Balaenoptera musculus', 'Endangered'),
(6, 'Green Turtle', 'Chelonia mydas', 'Endangered'),
(7, 'Chimpanzee', 'Pan troglodytes', 'Endangered'),
(8, 'Orangutan', 'Pongo pygmaeus', 'Critically Endangered'),
(9, 'Polar Bear', 'Ursus maritimus', 'Vulnerable'),
(10, 'Red Panda', 'Ailurus fulgens', 'Endangered');

-- Inserting data into Habitats Table
INSERT INTO Habitats (habitat_id, habitat_name, location)
VALUES 
(1, 'Savannah', 'Africa'),
(2, 'Rainforest', 'Asia'),
(3, 'Temperate Forest', 'China'),
(4, 'Mountain Range', 'Himalayas'),
(5, 'Ocean', 'Global'),
(6, 'Coral Reef', 'Oceania'),
(7, 'Tropical Forest', 'Congo Basin'),
(8, 'Mangrove', 'Southeast Asia'),
(9, 'Arctic', 'Arctic Circle'),
(10, 'Bamboo Forest', 'Eastern Himalayas');

-- Inserting data into Animals Table
INSERT INTO Animals (animal_id, species_id, habitat_id, name, age)
VALUES 
(1, 1, 1, 'Dumbo', 10),
(2, 2, 2, 'Sheru', 7),
(3, 3, 3, 'Bao Bao', 5),
(4, 4, 4, 'Snowy', 8),
(5, 5, 5, 'Big Blue', 25),
(6, 6, 6, 'Shelly', 50),
(7, 7, 7, 'Chimp', 12),
(8, 8, 8, 'Orangie', 15),
(9, 9, 9, 'Polaris', 10),
(10, 10, 10, 'Red', 6);

-- Inserting data into Observations Table
INSERT INTO Observations (observation_id, animal_id, observation_date, notes)
VALUES 
(1, 1, '2024-01-01', 'Observed grazing.'),
(2, 2, '2024-02-01', 'Observed hunting.'),
(3, 3, '2024-03-01', 'Observed playing.'),
(4, 4, '2024-04-01', 'Observed climbing.'),
(5, 5, '2024-05-01', 'Observed swimming.'),
(6, 6, '2024-06-01', 'Observed nesting.'),
(7, 7, '2024-07-01', 'Observed tool using.'),
(8, 8, '2024-08-01', 'Observed foraging.'),
(9, 9, '2024-09-01', 'Observed hunting.'),
(10, 10, '2024-10-01', 'Observed eating bamboo.');

-- Inserting data into Volunteers Table
INSERT INTO Volunteers (volunteer_id, first_name, last_name, phone, email)
VALUES 
(1, 'John', 'Doe', '123-456-7890', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '987-654-3210', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', '555-555-5555', 'alice.johnson@example.com'),
(4, 'Bob', 'Brown', '555-123-4567', 'bob.brown@example.com'),
(5, 'Charlie', 'Davis', '555-987-6543', 'charlie.davis@example.com'),
(6, 'Diana', 'Miller', '555-555-1234', 'diana.miller@example.com'),
(7, 'Evan', 'Garcia', '555-555-5678', 'evan.garcia@example.com'),
(8, 'Fiona', 'Martinez', '555-555-8765', 'fiona.martinez@example.com'),
(9, 'George', 'Wilson', '555-555-4321', 'george.wilson@example.com'),
(10, 'Hannah', 'Taylor', '555-555-6789', 'hannah.taylor@example.com');

-- Inserting data into ConservationActivity Table
INSERT INTO ConservationActivity (activity_id, activity_name, description)
VALUES 
(1, 'Tree Planting', 'Planting trees in deforested areas.'),
(2, 'Clean-Up Drive', 'Cleaning up litter in natural habitats.'),
(3, 'Wildlife Monitoring', 'Monitoring the health and behavior of wildlife.'),
(4, 'Habitat Restoration', 'Restoring damaged habitats.'),
(5, 'Environmental Education', 'Educating the public about conservation.'),
(6, 'Species Research', 'Conducting research on endangered species.'),
(7, 'Anti-Poaching Patrols', 'Patrolling areas to prevent poaching.'),
(8, 'Wildlife Rescue', 'Rescuing injured or endangered wildlife.'),
(9, 'Marine Conservation', 'Protecting marine environments and species.'),
(10, 'Climate Action', 'Taking action to mitigate climate change.');

-- Inserting data into VolunteerActivity Table
INSERT INTO VolunteerActivity (volunteer_id, activity_id, date, hours)
VALUES 
(1, 1, '2024-01-15', 4),
(2, 2, '2024-02-15', 3),
(3, 3, '2024-03-15', 5),
(4, 4, '2024-04-15', 6),
(5, 5, '2024-05-15', 2),
(6, 6, '2024-06-15', 7),
(7, 7, '2024-07-15', 8),
(8, 8, '2024-08-15', 4),
(9, 9, '2024-09-15', 3),
(10, 10, '2024-10-15', 6);

-- Inserting data into Equipment Table
INSERT INTO Equipment (equipment_id, equipment_name, description)
VALUES 
(1, 'Shovels', 'Used for digging.'),
(2, 'Trash Bags', 'Used for collecting litter.'),
(3, 'Binoculars', 'Used for observing wildlife.'),
(4, 'Cameras', 'Used for documenting wildlife.'),
(5, 'GPS Devices', 'Used for tracking animal movements.'),
(6, 'Drones', 'Used for aerial surveys.'),
(7, 'Nets', 'Used for capturing small animals safely.'),
(8, 'Protective Gear', 'Used for safety in the field.'),
(9, 'Boats', 'Used for marine activities.'),
(10, 'Monitoring Equipment', 'Used for environmental monitoring.');

-- Inserting data into ActivityEquipment Table
INSERT INTO ActivityEquipment (activity_id, equipment_id, quantity)
VALUES 
(1, 1, 10),
(2, 2, 50),
(3, 3, 5),
(4, 4, 20),
(5, 5, 15),
(6, 6, 8),
(7, 7, 30),
(8, 8, 25),
(9, 9, 10),
(10, 10, 12);

-- Inserting data into SpeciesThreats Table
INSERT INTO SpeciesThreats (threat_id, threat_name, description)
VALUES 
(1, 'Poaching', 'Illegal hunting of animals.'),
(2, 'Habitat Loss', 'Destruction of natural habitats.'),
(3, 'Climate Change', 'Global changes in climate affecting species.'),
(4, 'Pollution', 'Contamination of natural habitats.'),
(5, 'Invasive Species', 'Non-native species harming the ecosystem.'),
(6, 'Disease', 'Outbreaks of disease among wildlife.'),
(7, 'Overfishing', 'Excessive fishing reducing marine populations.'),
(8, 'Deforestation', 'Clearing of forests for human use.'),
(9, 'Urbanization', 'Expansion of cities into natural habitats.'),
(10, 'Water Scarcity', 'Lack of water affecting species survival.');

-- Inserting data into Funding Table
INSERT INTO Funding (funding_id, source, amount, funding_date)
VALUES 
(1, 'Wildlife Conservation Fund', 5000.00, '2024-01-01'),
(2, 'Global Environmental Organization', 10000.00, '2024-02-01'),
(3, 'National Parks Association', 7500.00, '2024-03-01'),
(4, 'Conservation Trust', 6000.00, '2024-04-01'),
(5, 'Eco-Friendly Enterprises', 8500.00, '2024-05-01'),
(6, 'Wildlife Lovers Club', 3000.00, '2024-06-01'),
(7, 'Green Earth Initiative', 9500.00, '2024-07-01'),
(8, 'Nature Supporters Group', 12000.00, '2024-08-01'),
(9, 'Animal Protection Fund', 7000.00, '2024-09-01'),
(10, 'Environmentalist Society', 11000.00, '2024-10-01');

-- View for Animals with their Species and Habitat information
CREATE VIEW AnimalDetails AS
SELECT 
    a.animal_id, 
    a.name AS animal_name, 
    s.common_name AS species_name, 
    h.habitat_name
FROM 
    Animals a
    JOIN Species s ON a.species_id = s.species_id
    JOIN Habitats h ON a.habitat_id = h.habitat_id;

-- View for Volunteer Activities with Volunteer names and Activity details
CREATE VIEW VolunteerActivityDetails AS
SELECT 
    va.volunteer_id, 
    v.first_name, 
    v.last_name, 
    ca.activity_name, 
    va.date, 
    va.hours
FROM 
    VolunteerActivity va
    JOIN Volunteers v ON va.volunteer_id = v.volunteer_id
    JOIN ConservationActivity ca ON va.activity_id = ca.activity_id;

-- View for Observation details with Animal names
CREATE VIEW ObservationDetails 
AS
SELECT
    o.observation_id, 
    a.name AS animal_name, 
    o.observation_date, 
    o.notes
FROM 
    Observations o
    JOIN Animals a ON o.animal_id = a.animal_id;

-- Index on the species_id column in Animals table
CREATE INDEX idx_species_id ON Animals(species_id);

-- Index on the habitat_id column in Animals table
CREATE INDEX idx_habitat_id ON Animals(habitat_id);

-- Index on the volunteer_id column in VolunteerActivity table
CREATE INDEX idx_volunteer_id ON VolunteerActivity(volunteer_id);

-- Index on the activity_id column in VolunteerActivity table
CREATE INDEX idx_activity_id ON VolunteerActivity(activity_id);

-- Index on the animal_id column in Observations table
CREATE INDEX idx_animal_id ON Observations(animal_id);

-- 1. Retrieve all animals with their species and habitat details
CREATE PROCEDURE GetAllAnimalsDetails
as
Begin
SELECT * FROM AnimalDetails;
END;

-- 2. Retrieve all volunteer activities with volunteer names and activity details
CREATE PROCEDURE GetAllVolunteerActivities
AS
BEGIN
    SELECT * FROM VolunteerActivityDetails;
END;

-- 3. Retrieve all observations with animal names and observation details
CREATE PROCEDURE GetAllObservations
AS
BEGIN
    SELECT * FROM ObservationDetails;
END;

-- 4. Find all animals in a specific habitat (e.g., 'Savannah')
CREATE PROCEDURE GetAnimalsInHabitat (
    @habitat_name VARCHAR(100)
)
AS
BEGIN
    SELECT * FROM AnimalDetails WHERE habitat_name = @habitat_name;
END;

-- 5. Find all activities done by a specific volunteer (e.g., volunteer_id = 1)
CREATE PROCEDURE GetActivitiesByVolunteer (
    @volunteer_id INT
)
AS
BEGIN
    SELECT * FROM VolunteerActivityDetails WHERE volunteer_id = @volunteer_id;
END;

-- 6. Find all observations for a specific animal (e.g., animal_id = 1)
CREATE PROCEDURE GetObservationsByAnimal (
    @animal_name VARCHAR(50)
)
AS
BEGIN
    SELECT * FROM ObservationDetails where animal_name = @animal_name;
END;

-- 7. Count the number of animals per species
CREATE PROCEDURE CountAnimalsPerSpecies
AS
BEGIN
    SELECT species_id, COUNT(*) AS num_animals
    FROM Animals
    GROUP BY species_id;
END;

-- 8. Count the number of volunteers involved in each activity
CREATE PROCEDURE CountVolunteersPerActivity
AS
BEGIN
    SELECT activity_id, COUNT(*) AS num_volunteers
    FROM VolunteerActivity
    GROUP BY activity_id;
END;

-- 9. Calculate the total funding received from each source
CREATE PROCEDURE TotalFundingPerSource
AS
BEGIN
    SELECT source, SUM(amount) AS total_funding
    FROM Funding
    GROUP BY source;
END;


EXEC TotalFundingPerSource;