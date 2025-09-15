INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MUCfVP-CAYM', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MUCfVP-CAYM' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_DRYDOCK') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 0);


---------------------------------------------------
-- Text (en_US)
---------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_ERA_FW_FUTURE', 'Future Era'),
('TXT_KEY_ERA_FW_FUTURE_SHORT', 'Future');

--===========================
-- Policoes
--===========================

--===========================
-- Policies (en_US) – HELP only
--===========================

-- Entrepreneurship
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Entrepreneurship[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness from Workshops.[NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold from every Mine, Quarry, Lumber Mill, Generator, Reseach Campus and Industrial Complex.[NEWLINE][ICON_BULLET]+25% Yields when you expend [ICON_GREAT_MERCHANT] Great Merchants or [ICON_GREAT_ENGINEER] Great Engineers for their Instant Yield abilities.'
WHERE Tag = 'TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';

-- Merchant Navy → Exploitation
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Exploitation[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_FOOD] Food and +1 [ICON_PRODUCTION] Production from Farms, Camps, Plantations, Preserves, ECO-Villages, and Hydroponics Districts.[NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science from Coasts, Lakes, and Oceans.'
WHERE Tag = 'TXT_KEY_POLICY_MERCHANT_NAVY_HELP';
-- Sovereignty
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Rights of Man[ENDCOLOR][NEWLINE][ICON_BULLET]-1 [ICON_HAPPINESS_3] Unhappiness from all Needs in all Cities.[NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Villages, Comm-arrys and Preserves.[NEWLINE][ICON_BULLET]+10% [ICON_RESEARCH] Science during [ICON_GOLDEN_AGE] Golden Ages.'
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY_HELP';

-- Civil Society
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Civil Society[ENDCOLOR]: Specialists consume 2 [ICON_FOOD] Food less than normal (minimum 1 [ICON_FOOD] Food). Farms, ECO-Villages, Hydrophonics Districts, Plantations, Camps, and all Unique Improvements produce +4 [ICON_FOOD] Food.'
WHERE Tag = 'TXT_KEY_POLICY_CIVIL_SOCIETY_HELP';
-- Five Year Plan
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Five-Year Plan[ENDCOLOR]: +20% [ICON_PRODUCTION] Production towards Buildings in all Cities. +3 [ICON_PRODUCTION] Production for every Mine, Quarry, Lumber Mill, Oil Well, Comm-arry, Genarators, Research Complex and Unique Improvement.'
WHERE Tag = 'TXT_KEY_POLICY_FIVE_YEAR_PLAN_HELP';

--=========================
-- Tech
--=========================
/* -> Do not Change this, VP victory lua error code
UPDATE Language_en_US
SET Text = 'Prometheus Space Program'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM';
*/

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]The Prometheus Space Program[ENDCOLOR] marks the beginning of humanity’s shift from Earth’s depleting resources to a new frontier.[NEWLINE][NEWLINE]If your civilization is the first to complete this Project, a [ICON_GREAT_SCIENTIST][COLOR_YELLOW]Great Scientist[ENDCOLOR] will appear near your [ICON_CAPITAL] Capital, and your civilization immediately enters a [ICON_GOLDEN_AGE] Golden Age.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_HELP';

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]The Prometheus Space Program[ENDCOLOR] represents the starting point of the interstellar race beyond Earth. Completing the program enables the construction of spaceship parts. Each civilization must complete the project on its own before it can begin construction. If you are the first to complete the program, you receive a Great Scientist and immediately enter a Golden Age.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_STRATEGY';

UPDATE Language_en_US
SET Text = 'Humanity’s thirst for exploration and intellectual curiosity has carried it beyond Earth into the vastness of space. The [COLOR_YELLOW]Prometheus Space Program[ENDCOLOR] embodies this innate drive, standing as the central institution of humankind’s quest for the stars. Its vision is nothing less than interstellar travel to our nearest stellar neighbor, Alpha Centauri.[NEWLINE][NEWLINE]The Prometheus Program pursues this ambition through research, technological development, and spacecraft construction, leading humanity into a new cosmic era. Its origins trace back to the space race of the mid-20th century, when nations sought to showcase their power and secure technological prestige. From this contest emerged achievements like sending humans to the Moon, probing Mars, and even daring to imagine ships bound for Alpha Centauri.[NEWLINE][NEWLINE]But such developments were not driven by science alone. Climate change, resource scarcity, and overpopulation turned space into a matter of survival as well as discovery. The Prometheus Program became a crucial step in expanding humanity’s living space.[NEWLINE][NEWLINE]Today it leads efforts in interstellar research, the development of technologies essential for extending humanity’s presence in the cosmos, and preparations for the first journey to Alpha Centauri. These efforts broaden our knowledge, open new possibilities, and may ultimately secure humanity’s place among the stars.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_PEDIA';

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_TECH_FW_SEA_EXPLORE_TITLE','Ocean Exploration'),
('TXT_KEY_TECH_FW_SEA_EXPLORE_DESC','Humanity has long used the seas for passage and food, yet the abyss that covers most of the planet remains unknown. Autonomous Underwater Vehicles (AUVs), remotely operated vehicles (ROVs), and survey suites that fuse synthetic-aperture sonar, magnetic, and optical sensors now map shelves, mid-ocean ridges, and hydrothermal vents in detail, revealing deposits of strategic minerals such as manganese nodules, cobalt crusts, and rare-earth muds. At the same time, artificial reefs for coastal restoration, recirculating aquaculture, and low-impact seabed mining techniques are turning the ocean into a new living sphere where extraction, habitation, and conservation coexist. Ocean exploration binds these technical and environmental advances into a single blue strategy to monitor, understand, and steward the seas responsibly.'),
('TXT_KEY_TECH_FW_SEA_EXPLORE_HELP','Allows deep-sea mining, aquaculture labs for food production, and artificial reefs to boost city yields. Enables construction of undersea tunnels that connect offshore islands and continents to the land trade network.'),
('TXT_KEY_TECH_FW_SEA_EXPLORE_QUOTE','[NEWLINE][TAB][TAB]"Knowledge of the oceans is more than a matter of curiosity. Our very survival may hinge upon it."[NEWLINE][TAB][TAB] - John F. Kennedy[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GEN_MANIP_TITLE','Genetic Engineering'),
('TXT_KEY_TECH_FW_GEN_MANIP_DESC','With the discovery of DNA and growing ability to manipulate organisms at the genetic level, researchers began to probe the effects of altering hereditary makeup to “improve” life in various ways. Yet genetic modification is fraught with risk: even simple organisms, when altered, can have unintended biological and environmental impacts. Human genetic alteration, especially, raises profound social and ethical concerns—though some argue potential benefits outweigh the risks.'),
('TXT_KEY_TECH_FW_GEN_MANIP_HELP','Allows construction of the Genetic Engineering Lab to boost [ICON_FOOD] Food. Enables building Xenofungus Hatcheries in cities and on the map to secure strategic resources. Allows construction of Preserves.'),
('TXT_KEY_TECH_FW_GEN_MANIP_QUOTE','[NEWLINE][TAB][TAB]"We talk every day about ‘this gene’ and ‘that gene,’ but biology doesn’t work that way… we are not pre-programmed beings."[NEWLINE][TAB][TAB]- J. Craig Venter[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_SPACE_EXPLORE_TITLE','Space Exploration'),
('TXT_KEY_TECH_FW_SPACE_EXPLORE_DESC','Humanity finally crossed the boundary of the atmosphere. Giant telescopes in orbit began to capture galaxies, nebulae, and even traces of the universe’s birth unseen from Earth. Exploration shifted from competition to a turning point in knowledge. Governments still invest heavily to lead the field, while private companies expand satellite communications, small probes, and commercial launch systems. Orbital communications webs emerge; microgravity opens unique research and manufacturing. Above all, we are now unveiling space scientifically. What once lived only in myth is revealed by observation and exploration.'),
('TXT_KEY_TECH_FW_SPACE_EXPLORE_HELP','Enables training of the Future Era Settler. Allows construction of the Spaceship Factory and the Hubble Space Telescope for space development. Unlocks Ballistic Missile and Cluster Missile units derived from launch technologies.'),
('TXT_KEY_TECH_FW_SPACE_EXPLORE_QUOTE','[NEWLINE][TAB][TAB]"The exploration and use of outer space, including the Moon and other celestial bodies, shall be carried out for the benefit and in the interests of all countries, irrespective of their degree of economic or scientific development, and shall be the province of all mankind."[NEWLINE][TAB][TAB] - Treaty on Principles Governing the Activities of States in the Exploration and Use of Outer Space, Article I[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ECOGENETICS_TITLE','Ecogenetics'),
('TXT_KEY_TECH_FW_ECOGENETICS_DESC','Classic environmentalism sought to defend nature from human activity, often treating the two as separate. As genetics advanced and ecosystems came into sharper focus, a systems view emerged: humans and environment as parts of one whole. Ecogenetics studies genetic diversity and adaptation within ecosystems, analyzing how a species’ genetic information interacts with environmental change. It preserves gene pools and clarifies biological mechanisms of response. Some neo-eugenic views argue for going beyond protection—toward designing mutual flourishing for humans and ecosystems, minimizing damage, preserving diversity, and enabling co-evolution toward sustainable balance.'),
('TXT_KEY_TECH_FW_ECOGENETICS_HELP','Allows recruitment of elite, gene-screened mercenaries and construction of eco-friendly Improvements—Preserves and ECO Villages—that increase yields on Forest/Jungle and Grassland/Plains. Enables building the Svalbard Global Seed Vault.'),
('TXT_KEY_TECH_FW_ECOGENETICS_QUOTE','[NEWLINE][TAB][TAB]"All life is interrelated, and from this intimacy comes the capacity to perceive; from perception, the natural practice of non-violence."[NEWLINE][TAB][TAB]- Arne Næss[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GRID_COMPUTING_TITLE','Grid Computing'),
('TXT_KEY_TECH_FW_GRID_COMPUTING_DESC','Computing has expanded into vast networks. Parallelism accelerates workloads; distributed systems are resilient to single-machine failure. Grid computing links countless independent resources as a virtual supercomputer, powering climate models, genomics, and particle physics. Beyond science, it underpins global finance, AI training, and real-time medical analytics—raising human capacity for knowledge and problem-solving to a new plane.'),
('TXT_KEY_TECH_FW_GRID_COMPUTING_HELP','Enables the mobile SAM launcher for air defense and the Cryptocurrency Exchange to increase city [ICON_GOLD] Gold and [ICON_GREAT_MERCHANT] Merchant specialist yields. Allows construction of the world wonder Shanghai World Financial Center.'),
('TXT_KEY_TECH_FW_GRID_COMPUTING_QUOTE','[NEWLINE][TAB][TAB]"I’ve been working on a new electronic cash system that’s fully peer-to-peer, with no trusted third party."[NEWLINE][TAB][TAB]- Satoshi Nakamoto[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_METAVERSE_TITLE','Virtual Simulation'),
('TXT_KEY_TECH_FW_METAVERSE_DESC','Virtual simulation provides safe, precise environments that replicate complex reality. It overcomes the limits and risks of physical testing in science, military training, and industrial design, enabling validation and optimization of future scenarios.'),
('TXT_KEY_TECH_FW_METAVERSE_HELP','Allows construction of the Virtual Training Ground to accelerate military experience gain. Enables the Metaverse Museum for [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism. Unlocks production of Virtual Idol.'),
('TXT_KEY_TECH_FW_METAVERSE_QUOTE','[NEWLINE][TAB][TAB]"With simulation we make the impossible possible, the dangerous safe, and the future testable."[NEWLINE][TAB][TAB]- Ivan Sutherland[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_DATA_SCIENCE_TITLE','Data Science'),
('TXT_KEY_TECH_FW_DATA_SCIENCE_DESC','Data science collects, stores, and analyzes humanity’s flood of information to create new value. The deluge from the Internet, IoT sensors, satellites, and genomics exceeds traditional methods; big-data algorithms fused with AI define a new paradigm. It now predicts disease spread, analyzes climate change, optimizes cities and traffic, and tracks economies in real time—transforming decisions across society.'),
('TXT_KEY_TECH_FW_DATA_SCIENCE_HELP','Allows themed Data Servers that increase [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production. Enables additional Generators to strengthen the data infrastructure.'),
('TXT_KEY_TECH_FW_DATA_SCIENCE_QUOTE','[NEWLINE][TAB][TAB]"Without data, there is no theory, no science, and no innovation."[NEWLINE][TAB][TAB]- Peter Norvig[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_NANOMATERIALS_TITLE','Nanomaterials Engineering'),
('TXT_KEY_TECH_FW_NANOMATERIALS_DESC','Built on microfabrication and synthesis, nanomaterials engineering moves beyond burning coal, oil, and ore: it harvests carbon frameworks and trace minerals to form functional nanostructures. These ultrascale materials exhibit unique optical, electronic, and mechanical traits, upgrading energy systems, space instruments, and bioscience facilities. Ultimately, it reinvents resource use—breathing new life into dwindling stocks and opening paths to solve energy and environmental challenges.'),
('TXT_KEY_TECH_FW_NANOMATERIALS_HELP','Enables the Nanomaterials Plant that processes nanomaterials from extracted inputs such as Coal and Oil, and allows construction of the Nano Institute.'),
('TXT_KEY_TECH_FW_NANOMATERIALS_QUOTE','[NEWLINE][TAB][TAB]"Carbon atoms on a distant world rearranged into DNA; microbes formed; backbones grew; they swam the seas, mutated into amphibians, and crawled ashore. And at last a taxi appeared at the universe’s mouth—the alley."[NEWLINE][TAB][TAB] - Mark Coggins, "The Immortal Game"[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ARTIFICIAL_ENVIRONMENTS_TITLE','Artificial Environments'),
('TXT_KEY_TECH_FW_ARTIFICIAL_ENVIRONMENTS_DESC','Crewed space requires keeping humans alive in one of the harshest settings—air, water, and food in self-sufficient habitats. These technologies also apply underground, in deserts, and under the sea, vastly expanding livable space.'),
('TXT_KEY_TECH_FW_ARTIFICIAL_ENVIRONMENTS_HELP','Allows Vertical Farms for [ICON_FOOD] Food and [ICON_RESEARCH] Science. Enables Fast Attack Craft for coastal defense and Future-Era Infantry. Unlocks Hydroponics Districts on Farms, and allows construction of the Eden Project.'),
('TXT_KEY_TECH_FW_ARTIFICIAL_ENVIRONMENTS_QUOTE','[NEWLINE][TAB][TAB]"The more artificial the human environment becomes, the more ‘nature’ turns into a value term."[NEWLINE][TAB][TAB] - Wendell Berry[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_BIOTECHNOLOGY_TITLE','Biotechnology Engineering'),
('TXT_KEY_TECH_FW_BIOTECHNOLOGY_DESC','Biotechnology now manipulates structure and function at molecular scale. Marine-derived biomaterials and microbial metabolism interacting with minerals reveal catalytic architectures and accelerated energy conversions. By emulating and designing symbiotic pathways, we unlock green energy, pollutant breakdown, and novel materials—fusing life’s complexity with inorganic stability.'),
('TXT_KEY_TECH_FW_BIOTECHNOLOGY_HELP','Enables production of Ballistic-Missile Submarines. Allows Biofactories and Marine Bio Industrial Complexes to raise city production. Unlocks Biotech Institutes for output boosts and Xenofungus Hatcheries.'),
('TXT_KEY_TECH_FW_BIOTECHNOLOGY_QUOTE','[NEWLINE][TAB][TAB]"As biotechnology becomes widespread in daily life, we will enter an era beyond Darwinian evolution. Like marine organisms that extract metals, new life may enable ecological cycles in place of fossil fuels."[NEWLINE][TAB][TAB]- Freeman Dyson[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_BIOMEDICAL_TITLE','Biomedical Engineering'),
('TXT_KEY_TECH_FW_BIOMEDICAL_DESC','Combining embryonic stem-cell research with precision gene editing enables custom therapies and organ regeneration. CRISPR-Cas tools with stem-cell culture design resistant cells and lab-grown transplantable organs—reducing vulnerability and reshaping human biology.'),
('TXT_KEY_TECH_FW_BIOMEDICAL_HELP','Allows Genetic Editing Labs and Embryonic Regeneration Centers, enabling Bio-Augmentation Centers. Produces advanced medical units and special research facilities, improving [ICON_FOOD] Food yields to support population growth.'),
('TXT_KEY_TECH_FW_BIOMEDICAL_QUOTE','[NEWLINE][TAB][TAB]"We are no longer passive products of natural selection; we are becoming active designers of life."[NEWLINE][TAB][TAB] - Jennifer Doudna[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GENERATIVE_AI_TITLE','AI: Generative'),
('TXT_KEY_TECH_FW_GENERATIVE_AI_DESC','Generative AI creates and fuses knowledge, language, vision, and code in real time, collapsing R&D cycles. Humans co-work with AI to expand memory, analysis, and creativity; small teams rival large organizations. The accelerating loop between data and models upgrades decisions from materials and medicine to city ops and diplomacy—granting first movers an advantage in speed itself.'),
('TXT_KEY_TECH_FW_GENERATIVE_AI_HELP','Allows construction of the Network Backbone and Data Tower, increasing all yields. Enables AI-driven administration to raise city productivity and diplomatic influence. Allows Offshore Generators on water tiles.'),
('TXT_KEY_TECH_FW_GENERATIVE_AI_QUOTE','[NEWLINE][TAB][TAB]"AI is the most powerful tool humanity has made—and a key to changing how we understand ourselves."[NEWLINE][TAB][TAB]- Geoffrey Hinton[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_FUTURE_BALLISTICS_TITLE','Future Ballistics'),
('TXT_KEY_TECH_FW_FUTURE_BALLISTICS_DESC','Beyond rocketry, future ballistics integrate space and battlefield. Hypersonic systems exceed Mach 10 to strike globally in minutes. Reusable launch vehicles enable sub-orbital and orbital bombardment—projecting power from low Earth orbit and reshaping strategy.'),
('TXT_KEY_TECH_FW_FUTURE_BALLISTICS_HELP','Unlocks Hypersonic Missiles, Stealth UCAVs, and Sub-Orbital Bombers. Reusable launch tech accelerates space facility construction, improving city production and operational reach. Recon units gain GPS-aided performance.'),
('TXT_KEY_TECH_FW_FUTURE_BALLISTICS_QUOTE','[NEWLINE][TAB][TAB]"The next major war may be won—or lost—in space."[NEWLINE][TAB][TAB]- Acting U.S. Deputy Secretary of Defense Patrick Shanahan[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GEO_ENERGY_TITLE','Geo-Energy Engineering'),
('TXT_KEY_TECH_FW_GEO_ENERGY_DESC','Geo-energy engineering drills deep to tap heat and minerals, while advanced biofuel systems build sustainable energy. Geophysics labs develop new sources from geothermal and geochemistry; deep mining stabilizes extraction in extreme conditions—reducing fossil dependence and powering future cities and industry.'),
('TXT_KEY_TECH_FW_GEO_ENERGY_HELP','Allows Deep Boreholes and Geophysics Labs to greatly increase city energy output. Enables Advanced Biofuel Refineries to convert plant and mineral resources into high-efficiency energy.'),
('TXT_KEY_TECH_FW_GEO_ENERGY_QUOTE','[NEWLINE][TAB][TAB]"Geothermal provides three resources: energy for heating, cooling, and power; storage; and minerals."[NEWLINE][TAB][TAB]- Amanda Kolker, NREL[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_SYNTHETIC_BIOLOGY_TITLE','Synthetic Biology'),
('TXT_KEY_TECH_FW_SYNTHETIC_BIOLOGY_DESC','Synthetic biology now reaches beyond gene edits to partial restoration of extinct traits. Even without intact ancient DNA, close modern genomes can be recoded to reconstruct lost sequences, akin to “chickenosaurus” developmental work—culturing engineered embryos to revive traits or forms. The field expands from replication to de-extinction, improvement, and ecosystem repair, dissolving lines between biotech and conservation.'),
('TXT_KEY_TECH_FW_SYNTHETIC_BIOLOGY_HELP','Allows construction of Jurassic Park to produce Dinosaur units and restored ancient life. Enables the Cloning Lab to raise unit cap and increase [ICON_CULTURE] Culture and [ICON_RESEARCH] Science.'),
('TXT_KEY_TECH_FW_SYNTHETIC_BIOLOGY_QUOTE','[NEWLINE][TAB][TAB]"Life finds a way."[NEWLINE][TAB][TAB]- Ian Malcolm, Jurassic Park[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_BIO_HYBRID_TITLE','Biohybrid Engineering'),
('TXT_KEY_TECH_FW_BIO_HYBRID_DESC','Advances in bioengineering and bionics are bridging the gap between living tissue and metal. Biocompatible coatings, genetic tissue redesign, and nanoscale metal-cell bonding overcome rejection and enable seamless conversion and fusion—ushering in integrated biomechanical augmentation and self-repairing implants.'),
('TXT_KEY_TECH_FW_BIO_HYBRID_HELP','Allows Bio-Metal Fusion Vats/Extractors that derive future strategic resources from existing ones. Unlocks evolved hybrid aerial recon units.'),
('TXT_KEY_TECH_FW_BIO_HYBRID_QUOTE','[NEWLINE][TAB][TAB]"The science of today is the technology of tomorrow."[NEWLINE][TAB][TAB]"오늘날의 과학은 내일의 기술이다."[NEWLINE][TAB][TAB]- Edward Teller[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_INTEGRATED_AI_TITLE','AI: Integrated'),
('TXT_KEY_TECH_FW_INTEGRATED_AI_DESC','Integrated AI digitizes all five senses with high-precision sensors and fuses them in multimodal models, achieving contextual understanding of reality. Perception–planning–control closes into a single loop for real-time response and predictive control, while generative competence improves through continual real-world feedback.'),
('TXT_KEY_TECH_FW_INTEGRATED_AI_HELP','Allows construction of the Humanoid Robot Factory and strengthens the remote-hub system.'),
('TXT_KEY_TECH_FW_INTEGRATED_AI_QUOTE','[NEWLINE][TAB][TAB]"We are not just building thinking machines—we are building intelligences that experience and interpret the world."[NEWLINE][TAB][TAB]- Rodney Brooks[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ADVANCED_MATERIALS_TITLE','High-Energy Advanced Materials'),
('TXT_KEY_TECH_FW_ADVANCED_MATERIALS_DESC','Marrying ultrafine lasers, cryogenics, and high-pressure/high-temperature simulations, this field pursues room-temperature superconductors—unlocking lossless power, extreme magnetic control, and maximal efficiency. It promises post-silicon computing and maglev transport. Nuclear photon studies with high-density lasers seed novel shields and cooling systems.'),
('TXT_KEY_TECH_FW_ADVANCED_MATERIALS_HELP','Allows Precision Materials Labs to secure Nanomaterials and Uranium, improving city [ICON_RESEARCH] Science and energy efficiency. Enables construction of the Aperture Science Center.'),
('TXT_KEY_TECH_FW_ADVANCED_MATERIALS_QUOTE','[NEWLINE][TAB][TAB]"Developing a superconductor that works at room temperature is a true dream… such materials would revolutionize electronics and transform computing, medicine, energy, and transport."[NEWLINE][TAB][TAB]- Dean[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ASTRODYNAMICS_TITLE','Astrodynamics'),
('TXT_KEY_TECH_FW_ASTRODYNAMICS_DESC','Geo-engineering and future ballistics have ushered in the age of constellations. Orbital power satellites modulate solar input and enable smart grids. Skyhooks and novel transport connect ground and orbit, making space infrastructure real—the foundations of a human space era.'),
('TXT_KEY_TECH_FW_ASTRODYNAMICS_HELP','Enables Orbital Power Satellites and Skyhook Launch Facilities to establish orbital surveillance networks, increasing city [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science.'),
('TXT_KEY_TECH_FW_ASTRODYNAMICS_QUOTE','[NEWLINE][TAB][TAB]"We choose to go to the Moon… not because it is easy, but because it is hard."[NEWLINE][TAB][TAB]- John F. Kennedy (1962), Rice University[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_TRANSGENICS_TITLE','Transgenics'),
('TXT_KEY_TECH_FW_TRANSGENICS_DESC','Xeno fungus, once a biological mystery, was found to contain a highly reactive mutagen—the Pholus Mutagen—capable of reprogramming expression via epigenetic pathways. It enables bespoke gene edits, accelerated evolution, and ecosystem design.'),
('TXT_KEY_TECH_FW_TRANSGENICS_HELP','Allows construction of the Biotech Center to secure additional [ICON_RES_XENO_FUNGUS] Xeno Fungus and Pholus Mutagen. Increases city [ICON_RESEARCH] Science, [ICON_FOOD] Food, and [ICON_PRODUCTION] Production, and unlocks special gene-modified units with Mutation promotions.'),
('TXT_KEY_TECH_FW_TRANSGENICS_QUOTE','[NEWLINE][TAB][TAB]"Nothing is so painful to the human mind as a great and sudden change."[NEWLINE][TAB][TAB]- Mary Shelley, Frankenstein (1818)[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_NEURAL_INTERFACE_TITLE','Neural Interface'),
('TXT_KEY_TECH_FW_NEURAL_INTERFACE_DESC','Biocomputers—combining cellular computation with quantum information—overcome immune rejection and maximize biocompatibility, enabling direct brain–computer interfaces. Beyond prosthetics, they support sensory feedback and cognitive integration, redefining the human–machine boundary.'),
('TXT_KEY_TECH_FW_NEURAL_INTERFACE_HELP','Allows construction of the Biocomputer, greatly accelerating [ICON_RESEARCH] Science and fusing life sciences with AI. Enables Seaworld development and production of Neuro SAM Launchers, Neuro Cruisers, and Neuro Destroyers. Increases city [ICON_RESEARCH] Science and [ICON_PRODUCTION] Production.'),
('TXT_KEY_TECH_FW_NEURAL_INTERFACE_QUOTE','[NEWLINE][TAB][TAB]"The brain is the most complex biological structure known in the universe."[NEWLINE][TAB][TAB]- Gerald Edelman[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_AUTONOMOUS_SYSTEMS_TITLE','AI: Fully Autonomous Systems'),
('TXT_KEY_TECH_FW_AUTONOMOUS_SYSTEMS_DESC','Autonomy now takes humanoid form. With AI, machine learning, and real-time sensor fusion, robots decide and act in complex settings—industry, space, disaster response, and war—mimicking human perception and motion for precision and tactics.'),
('TXT_KEY_TECH_FW_AUTONOMOUS_SYSTEMS_HELP','Allows unmanned Management Bases to enhance robot units. Enables Support Nodes that increase city defense, and Nanohives that accelerate robot unit healing.'),
('TXT_KEY_TECH_FW_AUTONOMOUS_SYSTEMS_QUOTE','[NEWLINE][TAB][TAB]"Never do for yourself what someone else can do for you."[TAB][TAB] - Agatha Christie, The Labors of Hercules[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_PLASMA_ENERGY_TITLE','Superconductivity–Plasma Energy Dynamics'),
('TXT_KEY_TECH_FW_PLASMA_ENERGY_DESC','Coupling lossless superconducting currents with controlled high-temperature plasma enables next-generation power. Superconductors sustain intense magnetic fields that confine fusion plasma, while applications extend to high-power storage, maglev networks, and electromagnetic propulsion—linking plasma energy and quantum circuits across aerospace, defense, and advanced industry.'),
('TXT_KEY_TECH_FW_PLASMA_ENERGY_HELP','Allows construction of Maglev High-Speed Rail and unlocks Plasma Bombers and advanced Fighters. Adds high-performance energy modules to space stations to support long-duration missions.'),
('TXT_KEY_TECH_FW_PLASMA_ENERGY_QUOTE','[NEWLINE][TAB][TAB]"Physics is not only the most accurate form of prediction—it’s the only job that does daily work."[NEWLINE][TAB][TAB]- Neil deGrasse Tyson[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ARCOLOGIES_TITLE','Arcologies'),
('TXT_KEY_TECH_FW_ARCOLOGIES_DESC','Arcological cities merge superconducting energy, aerospace, and artificial ecologies into self-sufficient megastructures. Climate-independent internal ecosystems, renewable grids, and high automation sustain life, while aerial-space complexes integrate admin, military, and research as hubs for stealth UCAVs, sub-orbital bombers, and space launch.'),
('TXT_KEY_TECH_FW_ARCOLOGIES_HELP','Allows the Arcology Improvement, increasing [ICON_ENERGY] Energy, [ICON_CULTURE] Culture, and [ICON_GOLD] Gold. Unlocks Aerospace Complexes, Helicarriers, Sub-Orbital Bombers, and Stealth UCAVs.'),
('TXT_KEY_TECH_FW_ARCOLOGIES_QUOTE','[NEWLINE][TAB][TAB]"Architecture is the physical form of the human ecosystem—the composition of matter that permits the highest energy and intentional flow."[NEWLINE][TAB][TAB]- Paolo Soleri[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GENGINEERING_TITLE','Life Design'),
('TXT_KEY_TECH_FW_GENGINEERING_DESC','Life Design fuses genome editing, synthetic biology, and artificial genome assembly to create new organisms. CRISPR precision and synthetic assembly exceed natural limits—producing tailored life with adaptive metabolism, resilience, and purpose-built functions, turning life into a platform for information, energy, and environmental control.'),
('TXT_KEY_TECH_FW_GENGINEERING_HELP','Allows life-form facilities that strengthen bio-units. Enables mass production of gene-modified Swarmers that require no strategic resources. Unlocks the Hive world wonder to enhance your military.'),
('TXT_KEY_TECH_FW_GENGINEERING_QUOTE','[NEWLINE][TAB][TAB]"If you realize that all things change, there is nothing you will try to hold on to. If you are not afraid of dying, there is nothing you cannot achieve."[NEWLINE][TAB][TAB] - Laozi, Tao Te Ching[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_BIOMODIFICATION_TITLE','Biomodification'),
('TXT_KEY_TECH_FW_BIOMODIFICATION_DESC','Biomodification precisely alters genetic and epigenetic traits to enhance physical and cognitive ability. CRISPR edits, metabolic rewiring, and epigenetic control yield heat/radiation/hypoxia tolerance, high-tension muscle fibers, rapid recovery, and faster reflex arcs—blurring human/non-human lines and enabling survival in deep space, abyssal seas, and warzones.'),
('TXT_KEY_TECH_FW_BIOMODIFICATION_HELP','Allows the Weapon Waste Recycling Plant to convert munitions waste into organics for major [ICON_FOOD] Food gains. Enables Bio-Enhancement Centers that greatly improve gunpowder units.'),
('TXT_KEY_TECH_FW_BIOMODIFICATION_QUOTE','[NEWLINE][TAB][TAB]"As human beings, our only measure of value is grounded in the reduction of suffering in existence."[NEWLINE][TAB][TAB] - H. P. Lovecraft[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_QUANTUM_SYNC_TITLE','Quantum Remote Synchronization'),
('TXT_KEY_TECH_FW_QUANTUM_SYNC_DESC','Quantum entanglement links real-time sensory and motor signals between nervous systems and distant machines. Operators feel and control robots or probes thousands of kilometers away as their own bodies—extending human judgment into remote operations across war, deep sea, and space.'),
('TXT_KEY_TECH_FW_QUANTUM_SYNC_HELP','Unlocks Hover Tanks—fast, hard-hitting armor—and the silent sea assassin, the Leviathan. Allows construction of the Quantum Link and Mnemosyne facilities that grant promotions for accelerated experience gain.'),
('TXT_KEY_TECH_FW_QUANTUM_SYNC_QUOTE','[NEWLINE][TAB][TAB]"The world of the future will be an ever more demanding struggle against the limitations of our intelligence, not a comfortable hammock served by robot slaves." - Norbert Wiener[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_AGI_TITLE','AGI: Artificial General Intelligence'),
('TXT_KEY_TECH_FW_AGI_DESC','AGI transcends task-bound AI: a system with human-level general intelligence and self-reflection. It learns, reasons, and solves novel problems, reproducing the full range of human cognition. It may be partner—or rival—raising deep philosophical and ethical debates.'),
('TXT_KEY_TECH_FW_AGI_HELP','Allows construction of the Skynet world wonder to strengthen robot units. Enables the Big Brother Control Center to increase spy resistance. Unlocks Robot Legions.'),
('TXT_KEY_TECH_FW_AGI_QUOTE','[NEWLINE][TAB][TAB]"Cogito, ergo sum."[NEWLINE][TAB][TAB]- René Descartes[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_PLANETARY_MIGRATION_TITLE','Planetary Migration Plan'),
('TXT_KEY_TECH_FW_PLANETARY_MIGRATION_DESC','A long-term program to settle beyond the Solar System—toward Alpha Centauri and other stars—founding a spacefaring civilization and answering resource and environmental crises. Its preparation spans nanomaterials, the deployment of Space Marines and giant mecha, and Prometheus-era research into our origins.'),
('TXT_KEY_TECH_FW_PLANETARY_MIGRATION_HELP','Build Asteroid Mining Bases to obtain Nanomaterials. Train the mighty defender Gundam and recon unit X-COM. Advance toward Science Victory through the Prometheus Program.'),
('TXT_KEY_TECH_FW_PLANETARY_MIGRATION_QUOTE','[NEWLINE][NEWLINE]"Mars is far enough from Earth to be more survivable than a lunar base in a war, so establishing a self-sustaining base on Mars is important. If we don’t make a self-sustaining city on Mars, I would consider that a failure in my lifetime."[NEWLINE][NEWLINE]- Elon Musk[NEWLINE][NEWLINE]'),

('TXT_KEY_TECH_FW_SPACE_HABITATS_TITLE','Orbital Habitats'),
('TXT_KEY_TECH_FW_SPACE_HABITATS_DESC','Orbital engineering standardizes Lagrange hubs, orbital rings, and agridomes into mega-complexes for habitation, production, and research without ground support. Microgravity enables ultra-pure materials, single-crystal alloys, and biocultures that surpass terrestrial processes. With solar-power satellites, orbital refineries, and hydroponics linked to arcologies, closed-loop ecosystems sustain themselves. Asteroid capture and belt logistics provide stable raw-material flow, making orbital hubs keystones of military, administrative, and commercial activity.'),
('TXT_KEY_TECH_FW_SPACE_HABITATS_HELP','Allows construction of Orbital Food Facilities that raise [ICON_RESEARCH] Science, [ICON_FOOD] Food, and [ICON_PRODUCTION] Production. Enables the world wonder **Orbital Refinery**. High-purity refining and orbital farming yield [ICON_RES_NANOMAT] Nanomaterials. Grants the ability to retaliate against city attackers with Rods-from-God orbital strikes.'),
('TXT_KEY_TECH_FW_SPACE_HABITATS_QUOTE','[NEWLINE][TAB][TAB]"The dinosaurs became extinct because they didn’t have a space program. And if we become extinct because we don’t have a space program, it’ll be our own fault."[NEWLINE][TAB][TAB]- Larry Niven[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GENETIC_ACCELERATION_TITLE','Genetic Acceleration'),
('TXT_KEY_TECH_FW_GENETIC_ACCELERATION_DESC','Genetic Acceleration shortens adaptation at the molecular level. Precision edits, expression control, and artificial selection raise adaptation rates or design new forms—either enhancing existing species or crafting bespoke organisms for specific roles.'),
('TXT_KEY_TECH_FW_GENETIC_ACCELERATION_HELP','Unlocks the fast-moving harasser Chimera and the ultimate recon unit Bio-Drone.'),
('TXT_KEY_TECH_FW_GENETIC_ACCELERATION_QUOTE','[NEWLINE][TAB][TAB]"Man did not weave the web of life; he is merely a strand in it. Whatever he does to the web, he does to himself."[NEWLINE][TAB][TAB] - Chief Seattle[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_HUMAN_AUGMENTATION_TITLE','Human Augmentation'),
('TXT_KEY_TECH_FW_HUMAN_AUGMENTATION_QUOTE','[NEWLINE][TAB][TAB]"I always wondered if Ki was one of the Yamashita upgrades—too much adrenocorticotropic hormone and not enough monoamine oxidase?"[NEWLINE][TAB][TAB] - Adam Warren, A Plague of Angels[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_HUMAN_AUGMENTATION_DESC','Genetic biotransformation and quantum remote synchronization expand augmentation across almost every body component—via cultured tissue or cybernetic replacement. Experiments pursue a more stable “improved genome,” acknowledging the limits of the current human template.'),
('TXT_KEY_TECH_FW_HUMAN_AUGMENTATION_HELP','Allows construction of the Artificial Birth Facility to support greater population.'),

('TXT_KEY_TECH_FW_DIGITAL_SOCIETY_TITLE','Digital Society'),
('TXT_KEY_TECH_FW_DIGITAL_SOCIETY_QUOTE','[NEWLINE][TAB][TAB]"If you stay as you are, people will eventually come to you."[NEWLINE][TAB][TAB] - Robert Doisneau[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_DIGITAL_SOCIETY_DESC','With AI proliferation and quantum advances, mind–machine interfaces and teleoperation become everyday tools. Identity and presence extend beyond the body into digital space, reshaping society through networked co-presence and synthetic environments.'),
('TXT_KEY_TECH_FW_DIGITAL_SOCIETY_HELP','Allows the [COLOR_POSITIVE_TEXT]Brain Uploading Facility[ENDCOLOR], increasing [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture, at the cost of Population.'),

('TXT_KEY_TECH_FW_SMART_MATERIALS_TITLE','Smart Materials'),
('TXT_KEY_TECH_FW_SMART_MATERIALS_QUOTE','[NEWLINE][TAB][TAB]"Everything changes; nothing remains the same."[NEWLINE][TAB][TAB] - Siddhartha Gautama[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_SMART_MATERIALS_DESC','Smart materials self-adjust properties, shape, and function to stimuli. At scale they reconfigure buildings, defense, and transport on demand—serving as a universal platform from personal protection to habitation.'),
('TXT_KEY_TECH_FW_SMART_MATERIALS_HELP','Enables the powerful siege unit Angel and catastrophic antimatter-fusion bombs.'),

('TXT_KEY_TECH_FW_ENERGY_THEORY_TITLE','New Energy Theory'),
('TXT_KEY_TECH_FW_ENERGY_THEORY_QUOTE','[NEWLINE][TAB][TAB]"If you want to find the secrets of the universe, think in terms of energy, frequency, and vibration."[NEWLINE][TAB][TAB] - Nikola Tesla[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_ENERGY_THEORY_DESC','Pushing into extreme energies at the smallest scales transforms propulsion, power, and materials—driving booster engines, next-generation stations and outposts, and interplanetary range.'),
('TXT_KEY_TECH_FW_ENERGY_THEORY_HELP','Allows building of spaceship parts required for a Science Victory. Unlocks Space Fighters and Orbital Bombers.'),

('TXT_KEY_TECH_FW_HYPERSTRUCTURES_TITLE','Hyperstructures'),
('TXT_KEY_TECH_FW_HYPERSTRUCTURES_DESC','Extending ecological city concepts with new materials and methods will one day realize feats of colossal engineering while minimizing environmental impact—transformations that will reshape human society.'),
('TXT_KEY_TECH_FW_HYPERSTRUCTURES_HELP','Allows the Central Command Center to reinforce Arcologies. Unlocks new world wonders.'),
('TXT_KEY_TECH_FW_HYPERSTRUCTURES_QUOTE','[NEWLINE][TAB][TAB]"Men have become the tools of their tools."[NEWLINE][TAB][TAB]- Henry David Thoreau[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_HOMO_SUPERIOR_TITLE','Homo Superior'),
('TXT_KEY_TECH_FW_HOMO_SUPERIOR_QUOTE','[NEWLINE][TAB][TAB]"I teach you the Übermensch. Man is something to be surpassed."[NEWLINE][TAB][TAB] - Friedrich Nietzsche[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_HOMO_SUPERIOR_DESC','As biotechnics and cybernetics mature, bodies can be augmented in near-limitless ways—stronger, smarter, longer-lived, and freer of disease. Ethical worries persist, but humanity now stands ready to transcend limits.'),
('TXT_KEY_TECH_FW_HOMO_SUPERIOR_HELP','Grants a Diplomat toward a Diplomatic Victory.'),

('TXT_KEY_TECH_FW_COMPUTRONIUM_TITLE','Computronium'),
('TXT_KEY_TECH_FW_COMPUTRONIUM_QUOTE','[NEWLINE][TAB][TAB]"Humans are only as great as technology allows them to be."[NEWLINE][TAB][TAB] - George Orwell[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_COMPUTRONIUM_DESC','Computronium—coined by Norman Margolus and Tommaso Toffoli at MIT—is matter optimized as a programmable substrate for computation, able to emulate physical systems with extreme efficiency.'),
('TXT_KEY_TECH_FW_COMPUTRONIUM_HELP','Allows production of components required for a Science Victory. Enables construction of the world wonder “World Citizens’ Accord” for a Culture Victory.'),

('TXT_KEY_TECH_FW_SPACE_COLONIZATION_TITLE','Space Colonization'),
('TXT_KEY_TECH_FW_SPACE_COLONIZATION_QUOTE','[NEWLINE][TAB][TAB]"It is not the strongest or the most intelligent that survives, but the one most adaptable to change."[NEWLINE][TAB][TAB] - Charles Darwin[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_SPACE_COLONIZATION_DESC','Humanity’s primeval drive to explore finds its ultimate frontier in space. Achieving interstellar travel would rival the invention of tools as a civilizational watershed. This tech unifies long-duration living, resource cycling, and navigation/shipbuilding infrastructures into the practical foundation of settlement.'),
('TXT_KEY_TECH_FW_SPACE_COLONIZATION_HELP','Build spaceship parts and claim a Science Victory.');

--===========================
-- Resources
--===========================
INSERT INTO Language_en_US (Tag, Text) VALUES
-- XENO_FUNGUS
('TXT_KEY_RESOURCE_XENO_FUNGUS', 'Xeno Fungus'),
('TXT_KEY_RESOURCE_XENO_FUNGUS_HELP', 'A strategic resource used for powerful Future Era gene units and bio-augmented units. Tiles can spawn in cities with certain buildings, or be discovered on Grassland and Plains.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Strategic Resource Monopoly (25%):[ENDCOLOR] +2 unit experience.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Global Monopoly (50%):[ENDCOLOR] +1 [ICON_RESEARCH] Science and +1 [ICON_CULTURE] Culture on strategic resource tiles.'),
('TXT_KEY_RESOURCE_XENO_FUNGUS_TEXT', '**Xeno Fungus** is a spore-forming complex rarely found in Earth soils and flora. Under extreme stress (desiccation, metal ions, hypoxia) it triggers **epigenetic control (methylation/transcriptional tuning)** and activates mobile genetic elements, raising the odds of non-lethal, adaptive variation. Decades of genetic engineering clarified its action; today it is applied to phenotype acceleration, regeneration, and specialized bio-engineering.[NEWLINE] In response to external stressors (metal ions, pH, oxygen level, etc.), Xeno Fungus releases **extracellular vesicles (exosomes)** and ion-binding peptides that reset gene-expression programs without cutting DNA. Through epigenomic rewiring and transposon repositioning, it increases adaptive phenotype diversity and, over time, strengthens evolutionary pressure at the species scale.[NEWLINE]Xeno Fungus appears to be an Earth-born stress mediator that may have sparked evolutionary bursts during severe paleoenvironmental shifts. Incidence seems to be rising with abrupt modern climate change. High concentration or prolonged exposure can disrupt ecosystems and thus demands strict control.'),

-- Nanomaterial
('TXT_KEY_RESOURCE_NANOMAT', 'Nanomaterials'),
('TXT_KEY_RESOURCE_NANOMAT_HELP', 'Used to produce powerful Future Era units and construct advanced buildings. Spawns sparsely under extreme conditions on the map (Desert, Snow, Tundra, Ocean). Can be obtained via Oil Wells and offshore structures, and manufactured via Converters.'),
('TXT_KEY_RESOURCE_NANOMAT_TEXT', 'Nanomaterials possess structures of 1–1000 nm along at least one axis, where quantum effects directly shape properties. Spintronics, rare-earth/ferromagnetic nano-alloys with tuned bandgaps and spin states, and high-quality nanocrystals/heterojunctions underwrite next-generation computing, energy, and sensing. Because natural abundance is minimal, deep-sea mining, magnetic wells, and plasma synthesis are required.[NEWLINE]At the nanoscale, surface/interface/defect state density dominates; subtle composition or phase changes can fundamentally alter band structure and spin textures. From this arise spin-based logic (spintronics), precision catalysts/electrodes, and photo-electro-mechano multi-responsive metamaterials. Some architectures are candidates for high-/room-temperature superconductivity; realizing them hinges on impurity/defect control and precision nanofabrication.');

--===========================
-- Improvements 
--===========================
INSERT INTO Language_en_US (Tag, Text) VALUES
-- UNDERSEA TUNNEL
('TXT_KEY_UNDERSEA_TUNNEL', 'Undersea Tunnel'),
('TXT_KEY_UNDERSEA_TUNNEL_HELP', 'Land units can cross this Coast tile. Can be built only on Coast tiles adjacent to 2+ land tiles. On tiles with exactly 2 or 3 adjacent land tiles, the land tiles do not need to be adjacent to each other. Built by a Worker.[NEWLINE][NEWLINE] You may link cities over land by using tunnels, but [COLOR_NEGATIVE_TEXT]Land Trade Routes are not created by this connection.[ENDCOLOR]'),
('TXT_KEY_UNDERSEA_TUNNEL_TEXT', 'Land units can move quickly and safely across a coastal tile by using an Undersea Tunnel.'),
('TXT_KEY_BUILD_UNDERSEA_TUNNEL', 'Build [LINK=IMPROVEMENT_UNDERSEA_TUNNEL]Undersea Tunnel[/LINK]'),
('TXT_KEY_BUILD_UNDERSEA_TUNNEL_REC', 'Allows land units to cross this tile with a small combat penalty.'),
('TXT_KEY_BUILD_UNDERSEA_TUNNEL_HELP', 'Land units can cross this Coast tile. Can be built only on Coast tiles adjacent to 2+ land tiles. On tiles with exactly 2 or 3 adjacent land tiles, the land tiles do not need to be adjacent to each other. Built by a Worker.[NEWLINE][NEWLINE] You may link cities over land by using tunnels, but [COLOR_NEGATIVE_TEXT]Land Trade Routes are not created by this connection.[ENDCOLOR]'),

-- XENO FUNGUS CULTIVATION
('TXT_KEY_IMPROVEMENT_FW_FUNGAL_GROWTH','Xenofungus Farm'),
('TXT_KEY_IMPROVEMENT_FW_FUNGAL_GROWTH_TEXT','"Xenofungus is a spore-forming complex rarely found in Earth soils and flora, a mutagenic by-product associated with the Pholus Mutagen virus. Its most visible effect is plant morphing into fungus-like forms. Such flora develop network-like structures reminiscent of neural nets, interpret sensory input from the environment, and respond to perceived threats with toxins and biochemical assaults. Regions overgrown with Xenofungus are thus extremely dangerous to the unprepared. Scientific analysis shows that Xenofungus responds to extreme conditions (metal ions, hypoxia, acidity) by promoting **epigenetic control (methylation/transcriptional tuning)** and **mobile genetic element activity**, accelerating adaptive variation. By releasing extracellular vesicles and ion-binding peptides, it resets gene-expression programs without DNA cutting, inducing phenotype diversity and rapid adaptation. These processes underpin mutation, regeneration, and bio-augmentation research and can raise evolutionary pressure at the species scale over time.[NEWLINE]Some scholars suggest Xenofungus acted as a spark for evolution during severe paleoenvironmental shifts. High concentration and long exposure can disrupt ecosystems and spawn hostile mutant biota, so it is treated as a strategic resource requiring **strict management and study**.) However, the fungus also appears to coexist with humans or mutagen-exposed animals, providing nutrients and other valuable compounds such as medicines."'),
('TXT_KEY_IMPROVEMENT_FW_FUNGAL_GROWTH_HELP','This tile gains [ICON_FOOD]+2 Food, [ICON_RESEARCH]+2 Science, and [ICON_CULTURE]+2 Culture. Adjacent enemy units take [COLOR_NEGATIVE_TEXT]10 damage[ENDCOLOR] each turn.'),
('TXT_KEY_BUILD_FW_FUNGAL_GROWTH','Build Xenofungus Farm'),
('TXT_KEY_BUILD_FW_FUNGAL_GROWTH_HELP','Units fortified on this tile gain [COLOR_POSITIVE_TEXT]+50%[ENDCOLOR] Defense. Adjacent enemy units take [COLOR_NEGATIVE_TEXT]10 damage[ENDCOLOR] per turn. [COLOR_NEGATIVE_TEXT]Once built, it cannot be removed.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_FUNGAL_GROWTH_REC','Keeps Forest/Jungle/Marsh intact while providing +2 [ICON_FOOD] Food, +2 [ICON_RESEARCH] Science, and +2 [ICON_CULTURE] Culture on the tile; at turn end deals 10 HP damage to all adjacent enemy units.'),

-- NATURE PRESERVE
('TXT_KEY_IMPROVEMENT_FW_PRESERVE','Nature Preserve'),
('TXT_KEY_IMPROVEMENT_FW_PRESERVE_TEXT','Scientific progress multiplied our tools to shape the environment, but also made untouched nature scarcer. To safeguard ecosystems and foster ecotourism, more preserves are being designated. May be placed in continuous chains of tiles.[NEWLINE][NEWLINE]Adjacent Camps, Brazil Lumber Camps, Polders, and Preserves gain +1 [ICON_CULTURE] Culture.'),
('TXT_KEY_IMPROVEMENT_FW_PRESERVE_HELP','This tile gains [ICON_CULTURE]+3 Culture and [ICON_RESEARCH]+2 Science. May be placed in continuous chains.[NEWLINE][NEWLINE]Adjacent Camps, Brazil Lumber Camps, Polders, and Preserves gain [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_CULTURE] Culture.'),
('TXT_KEY_BUILD_FW_PRESERVE','Build Nature Preserve'),
('TXT_KEY_BUILD_FW_PRESERVE_HELP','Adjacent Preserves, Camps, Lumber Mills, Brazil Lumber Camps, and Polders gain +1 [ICON_CULTURE] Culture. Units on this tile gain [COLOR_POSITIVE_TEXT]+20%[ENDCOLOR] Defense.'),
('TXT_KEY_BUILD_FW_PRESERVE_REC','Increases the tile''s Culture and Science. Grants a [ICON_CULTURE] bonus when adjacent to another Preserve, a Camp, a Lumber Mill/Brazil Lumber Camp, or a Polder.'),

-- COMMUNICATION ARRAY
('TXT_KEY_IMPROVEMENT_FW_COMM_ARRAY','Communication Array'),
('TXT_KEY_IMPROVEMENT_FW_COMM_ARRAY_TEXT','A dedicated facility to enable inter-regional information exchange. Initially yields more Gold than a Trading Post; with researched techs it can also provide Culture or Science. Arrays cannot be adjacent to each other, limiting how many can be built.[NEWLINE][NEWLINE]This tile gains +2 [ICON_RESEARCH] Science, +2 [ICON_GOLD] Gold, and +2 [ICON_CULTURE] Culture. If built on a Hill, +1 [ICON_RESEARCH] Science and +1 [ICON_GOLD] Gold. [COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Array.[ENDCOLOR][NEWLINE][NEWLINE]Adjacent Villages, Holy Sites, Landmarks, and unique tile improvements gain +1 [ICON_CULTURE] Culture.'),
('TXT_KEY_IMPROVEMENT_FW_COMM_ARRAY_HELP','This tile gains [COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture. If built on a Hill, it gains [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_RESEARCH] Science and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Adjacent Villages, Holy Sites, Landmarks, and unique improvements gain [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Array.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_COMM_ARRAY','Build Communication Array'),
('TXT_KEY_BUILD_FW_COMM_ARRAY_HELP','If built on a Hill, +1 [ICON_RESEARCH] Science and +1 [ICON_GOLD] Gold. Adjacent Villages, Holy Sites, Landmarks, and unique tiles gain +1 [ICON_GOLDEN_AGE] Golden Age Points.'),
('TXT_KEY_BUILD_FW_COMM_ARRAY_REC','Increases tile Science, Culture, and Gold yields.'),

-- INDUSTRIAL COMPLEX
('TXT_KEY_IMPROVEMENT_FW_INDUSTRIAL_COMPLEX','Industrial Complex'),
('TXT_KEY_IMPROVEMENT_FW_INDUSTRIAL_COMPLEX_TEXT','Industrial complexes are large, dense agglomerations of factories, foundries, assembly plants, and related facilities. Grouping industry accelerates output and economies of scale, though such systems may also entangle with social and political structures. While not as efficient as Factories on a per-building basis, complexes meaningfully boost production across a region.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Complex.[ENDCOLOR]'),
('TXT_KEY_IMPROVEMENT_FW_INDUSTRIAL_COMPLEX_HELP','This tile gains [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+5[ENDCOLOR] Production and [ICON_GOLD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Gold.[NEWLINE][NEWLINE]All adjacent Manufactories gain [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+3[ENDCOLOR] Production.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Complex.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_INDUSTRIAL_COMPLEX','Build Industrial Complex'),
('TXT_KEY_BUILD_FW_INDUSTRIAL_COMPLEX_HELP','Adjacent Manufactories gain increased [ICON_PRODUCTION] Production. Units on this tile gain [COLOR_POSITIVE_TEXT]+20%[ENDCOLOR] Defense.'),
('TXT_KEY_BUILD_FW_INDUSTRIAL_COMPLEX_REC','Raises tile Production; adjacent Manufactories gain +3 Production.'),

-- Research Complex
('TXT_KEY_IMPROVEMENT_FW_HERC','Research Complex'),
('TXT_KEY_IMPROVEMENT_FW_HERC_TEXT','As science advances, so must the instruments that probe the universe''s mysteries. Specialized high-end laboratories and centers explore quantum mechanics, astrophysics, and particle physics.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Campus.[ENDCOLOR]'),
('TXT_KEY_IMPROVEMENT_FW_HERC_HELP','This tile gains [ICON_RESEARCH][COLOR_POSITIVE_TEXT]+5[ENDCOLOR] Science and [ICON_GOLD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Gold.[NEWLINE][NEWLINE]All adjacent Academies gain [ICON_RESEARCH][COLOR_POSITIVE_TEXT]+3[ENDCOLOR] Science.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Campus.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_HERC','Build Research Complex'),
('TXT_KEY_BUILD_FW_HERC_HELP','Adjacent Academies gain increased [ICON_RESEARCH] Science. Units on this tile gain [COLOR_POSITIVE_TEXT]+20%[ENDCOLOR] Defense.'),
('TXT_KEY_BUILD_FW_HERC_REC','Raises tile Science; adjacent Academies gain +3 Science.'),

-- BIOWELL (ECO VILLAGE)
('TXT_KEY_IMPROVEMENT_FW_BIOWELL','Eco-Village'),
('TXT_KEY_IMPROVEMENT_FW_BIOWELL_TEXT','As awareness of urbanization''s impact grew, communities sought more sustainable ways of living. Though smaller than later dense arcologies, self-sufficient eco villages in relatively pristine areas attracted ecotourism.[NEWLINE][NEWLINE]This tile gains +2 [ICON_FOOD] Food, +2 [ICON_CULTURE] Culture, and +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]All adjacent Farms gain +1 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Eco Village.[ENDCOLOR]'),
('TXT_KEY_IMPROVEMENT_FW_BIOWELL_HELP','This tile gains [ICON_FOOD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Food, [ICON_CULTURE][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Culture, and [ICON_GOLD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Gold.[NEWLINE][NEWLINE]All adjacent Farms gain [ICON_FOOD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Food.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Eco Village.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_BIOWELL','Build Eco-Village'),
('TXT_KEY_BUILD_FW_BIOWELL_HELP','All adjacent Farms gain +1 [ICON_CULTURE] Culture.'),
('TXT_KEY_BUILD_FW_BIOWELL_REC','Increases tile Food, Culture, and Gold.'),

-- GENERATOR (LAND)
('TXT_KEY_IMPROVEMENT_FW_GENERATOR','Generator'),
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_TEXT','Automation raised power demand on local grids, prompting deployment of auxiliary generators near major facilities.[NEWLINE][NEWLINE]Adjacent Towns, Industrial Complexes, Research Complexes, Biotech Centers, Support Nodes, and Arcologies gain +1 [ICON_GOLD] Gold.'),
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_HELP','This tile gains [ICON_GOLD][COLOR_POSITIVE_TEXT]+5[ENDCOLOR] Gold and [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Production.[NEWLINE][NEWLINE]Adjacent Towns, Research Complexes, Industrial Complexes, Biotech Centers, Support Nodes, and Arcologies gain [ICON_GOLD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Gold.'),
('TXT_KEY_BUILD_FW_GENERATOR','Build Generator'),
('TXT_KEY_BUILD_FW_GENERATOR_HELP','Adjacent Towns, Research Complexes, Industrial Complexes, Biotech Centers, Support Nodes, and Arcologies gain +1 [ICON_GOLD] Gold.'),
('TXT_KEY_BUILD_FW_GENERATOR_REC','Adjacent Towns/Research/Industry/Biotech/Support/Arcology gain +1 [ICON_GOLD] Gold.'),

-- GENERATOR (WATER)
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_WATER','Offshore Generator'),
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_WATER_TEXT','Automation raised power demand on coastal grids, leading to offshore auxiliaries.[NEWLINE][NEWLINE]Adjacent Towns, Industrial Complexes, Research Complexes, Biotech Centers, and Arcologies gain +1 [ICON_GOLD] Gold.'),
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_WATER_HELP','This tile gains [ICON_GOLD][COLOR_POSITIVE_TEXT]+5[ENDCOLOR] Gold and [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Production.[NEWLINE][NEWLINE]Adjacent Towns, Research Complexes, Industrial Complexes, Biotech Centers, Support Nodes, and Arcologies gain [ICON_GOLD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Gold.'),
('TXT_KEY_BUILD_FW_GENERATOR_WATER','Build Offshore Generator'),
('TXT_KEY_BUILD_FW_GENERATOR_WATER_HELP','Adjacent Towns, Research Complexes, Industrial Complexes, Biotech Centers, Support Nodes, and Arcologies gain +1 [ICON_GOLD] Gold.'),
('TXT_KEY_BUILD_FW_GENERATOR_WATER_REC','Adjacent Towns/Research/Industry/Biotech/Support/Arcology gain +1 [ICON_GOLD] Gold.'),

-- HYDROPONICS DOME
('TXT_KEY_IMPROVEMENT_FW_HYDROPONICS_DOME','Hydroponics District'),
('TXT_KEY_IMPROVEMENT_FW_HYDROPONICS_DOME_TEXT','Artificial cultivation methods grew ever more sophisticated. Hydroponics and aeroponics enable full indoor farming, letting food-poor communities grow staples locally without importing from fertile regions.[NEWLINE][NEWLINE]This tile gains +3 [ICON_FOOD] Food, +2 [ICON_RESEARCH] Science, and +1 [ICON_PRODUCTION] Production. All adjacent Farms gain +1 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Hydroponics District.[ENDCOLOR]'),
('TXT_KEY_IMPROVEMENT_FW_HYDROPONICS_DOME_HELP','This tile gains [ICON_FOOD][COLOR_POSITIVE_TEXT]+3[ENDCOLOR] Food, [ICON_RESEARCH][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Science, and [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Production.[NEWLINE][NEWLINE]All adjacent Farms gain [ICON_RESEARCH][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Science.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Hydroponics District.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_HYDROPONICS_DOME','Build Hydroponics District'),
('TXT_KEY_BUILD_FW_HYDROPONICS_DOME_HELP','All adjacent Farms gain +1 [ICON_RESEARCH] Science.'),
('TXT_KEY_BUILD_FW_HYDROPONICS_DOME_REC','Increases tile Food, Science, and Production.'),

-- BIOTECH CENTER
('TXT_KEY_IMPROVEMENT_FW_GENOCENTRE','Biotech Center'),
('TXT_KEY_IMPROVEMENT_FW_GENOCENTRE_TEXT','While most gene editing and transgenics began in urban labs, increasingly complex bio-manufacturing drove demand for centers away from cities, in controlled natural settings, to study GMO impact in situ.[NEWLINE][NEWLINE]This tile gains +4 [ICON_PRODUCTION] Production, +2 [ICON_GOLD] Gold, and +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]Adjacent Plantations and Camps gain +2 [ICON_GOLD] Gold; adjacent Pastures gain +2 [ICON_PRODUCTION] Production; adjacent Fishing Boats gain +2 [ICON_FOOD] Food.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Biotech Center.[ENDCOLOR]'),
('TXT_KEY_IMPROVEMENT_FW_GENOCENTRE_HELP','This tile gains [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+4[ENDCOLOR] Production, [ICON_GOLD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Gold, and [ICON_FOOD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Food.[NEWLINE]Adjacent Camps and Plantations gain [ICON_GOLD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Gold; adjacent Pastures gain [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Production; adjacent Fishing Boats gain [ICON_FOOD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Food.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Biotech Center.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_GENOCENTRE','Build Biotech Center'),
('TXT_KEY_BUILD_FW_GENOCENTRE_HELP','[COLOR_POSITIVE_TEXT]May be built on water tiles[ENDCOLOR]. Adjacent Villages, Pastures, and Fishing Boats gain yields. Units on this tile gain [COLOR_POSITIVE_TEXT]+100%[ENDCOLOR] [ICON_STRENGTH] Defense.'),
('TXT_KEY_BUILD_FW_GENOCENTRE_REC','Increases tile Food, Production, Gold, and Defense (+100%). May also be built on water.'),

-- Support Node
('TXT_KEY_IMPROVEMENT_FW_CORE','Support Node'),
('TXT_KEY_IMPROVEMENT_FW_CORE_TEXT','As forces grew more sophisticated—especially with widespread cybernetics—field maintenance became harder. Modular Support Nodes provide hardened positions plus extensive repair bays and workshops to keep complex equipment operational.[NEWLINE][NEWLINE]This tile gains [COLOR_POSITIVE_TEXT]+3[ENDCOLOR] [ICON_RESEARCH] Science and [ICON_GOLD] Gold. If adjacent to a city, gain an additional [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_RESEARCH] Science and [ICON_GOLD] Gold. If built on a Hill, gain +2 [ICON_PRODUCTION] Production and +1 [ICON_FOOD] Food. Deals [COLOR_NEGATIVE_TEXT]20 damage[ENDCOLOR] each turn to adjacent enemy units.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Support Node.[ENDCOLOR]'),
('TXT_KEY_IMPROVEMENT_FW_CORE_HELP','This tile gains [ICON_RESEARCH][COLOR_POSITIVE_TEXT]+3[ENDCOLOR] Science and [ICON_GOLD][COLOR_POSITIVE_TEXT]+3[ENDCOLOR] Gold. If adjacent to a city, gain an additional [ICON_RESEARCH][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Science and [ICON_GOLD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Gold; if on a Hill, gain [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Production and [ICON_FOOD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Food. Adjacent enemy units take [COLOR_NEGATIVE_TEXT]20 damage[ENDCOLOR] per turn.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Support Node.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_CORE','Build Support Node'),
('TXT_KEY_BUILD_FW_CORE_HELP','Yields increase if adjacent to a city or built on a Hill. [COLOR_NEGATIVE_TEXT]Damages adjacent enemy units each turn.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_CORE_REC','Raises tile Gold and Science; deals 20 HP per turn to nearby enemies.'),

-- ARCOLOGY
('TXT_KEY_IMPROVEMENT_FW_ARCOLOGY','Arcology'),
('TXT_KEY_IMPROVEMENT_FW_ARCOLOGY_TEXT','An arcology is a massive structure where many people can live with a self-contained environment.[NEWLINE][NEWLINE]This tile gains [ICON_CULTURE][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Culture, [ICON_FOOD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Food, [ICON_GOLD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Gold, and [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Production.[NEWLINE][NEWLINE]If adjacent to a city, gain an additional [ICON_FOOD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Food and [ICON_GOLD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Gold; if built on Coast, gain [ICON_GOLD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Gold.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Arcology.[ENDCOLOR]'),
('TXT_KEY_IMPROVEMENT_FW_ARCOLOGY_HELP','This tile gains [ICON_CULTURE][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Culture, [ICON_FOOD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Food, [ICON_GOLD][COLOR_POSITIVE_TEXT]+2[ENDCOLOR] Gold, and [ICON_PRODUCTION][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Production.[NEWLINE][NEWLINE]If adjacent to a city or Coast, gain an additional [ICON_FOOD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Food and [ICON_GOLD][COLOR_POSITIVE_TEXT]+1[ENDCOLOR] Gold.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot be built adjacent to another Arcology.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_ARCOLOGY', 'Build Arcology'),
('TXT_KEY_BUILD_FW_ARCOLOGY_HELP', 'Adjacent to a city or Coast, this tile gains additional [ICON_FOOD] Food and [ICON_GOLD] Gold. Units on this tile gain [COLOR_POSITIVE_TEXT]+100%[ENDCOLOR] [ICON_STRENGTH] Defense.'),
('TXT_KEY_BUILD_FW_ARCOLOGY_REC',  'Increases tile Food, Science, and Gold.'),

-- STRATEGIC MISSILE VAULT
('TXT_KEY_BUILD_FW_VAULT','Build [LINK=IMPROVEMENT_FW_VAULT]Strategic Missile Vault[/LINK]'),
('TXT_KEY_BUILD_FW_VAULT_HELP','Holds up to 3 missiles on this tile. Units on this tile gain +100% Defense.'),
('TXT_KEY_BUILD_FW_VAULT_REC','Units stationed here gain +100% Defense; this tile can store up to 3 missiles.'),
('TXT_KEY_IMPROVEMENT_FW_VAULT','Strategic Missile Vault'),
('TXT_KEY_IMPROVEMENT_FW_VAULT_TEXT','A sealed facility designated to protect missiles and personnel from fallout and debris after nuclear detonations.'),
('TXT_KEY_IMPROVEMENT_FW_VAULT_HELP','Stores up to 3 missiles on this tile; units on this tile gain [COLOR_POSITIVE_TEXT]+100%[ENDCOLOR] Defense.');

-- Spaceship Factory (en_US)
UPDATE Language_en_US
SET Text = 'Provides a [ICON_PRODUCTION] Production bonus of [COLOR_POSITIVE_TEXT]35%[ENDCOLOR] when constructing Spaceship Parts.[NEWLINE][NEWLINE]Requires [ICON_RES_ALUMINUM] Aluminum x[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_SPACESHIP_FACTORY_HELP'
  AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 2);

UPDATE Language_en_US
SET Text = 'Provides a [ICON_PRODUCTION] Production bonus of [COLOR_POSITIVE_TEXT]35%[ENDCOLOR] when constructing Spaceship Parts. Also provides a [ICON_PRODUCTION] Production bonus of [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] when training Air Units in this city, and grants the [COLOR_PLAYER_PURPLE]Spaceship[ENDCOLOR] promotion.[NEWLINE][NEWLINE]Requires [ICON_RES_ALUMINUM] Aluminum x[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_SPACESHIP_FACTORY_HELP'
  AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 1);


INSERT INTO Language_en_US (Tag, Text) VALUES
-- Aquaculture Lab
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB', 'Aquaculture Lab'),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_HELP', 'Spawns a nearby [ICON_RES_FISH] Fish resource. +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD] Food on worked Coast/Ocean tiles +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD] Food on worked sea resources.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress by [COLOR_POSITIVE_TEXT]1[ENDCOLOR].[NEWLINE][NEWLINE]Can only be constructed in a [COLOR_YELLOW]Coastal City[ENDCOLOR]. Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Harbor[ENDCOLOR] and cannot be built if the city has a [COLOR_NEGATIVE_TEXT]Undersea Mining Platform or Artificial Reef[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]If you found the 2K Foods Corporation,[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_FOOD] Food.'),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_STRATEGY', 'Build the Aquaculture Lab to develop tile improvements and boost Gold and Food on your city’s sea tiles.'),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_PEDIA', 'Just as agriculture and husbandry advanced through scientific methods, harvesting from the sea followed the same path. Modern aquaculture optimizes physiology, nutrition, and ecological interactions to maximize yield in limited waters. Norway’s large salmon farms, for example, use automated feeding, selective breeding, water-quality sensors, and marine-ecosystem analytics to deliver a stable, high-quality protein supply. These technologies support food security and sustainable ocean resource management.'),

-- Seawater Artificial Reef
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', 'Artificial Reef'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH] Science and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture on worked Coast/Ocean tiles.[NEWLINE][NEWLINE][ICON_RES_PEARLS] Pearls: +1[ICON_GOLD] +1[ICON_CULTURE][NEWLINE][ICON_RES_CRAB] Crab: +1[ICON_RESEARCH] +1[ICON_GOLD][NEWLINE][ICON_RES_CORAL] Coral: +1[ICON_RESEARCH] +1[ICON_CULTURE][NEWLINE][NEWLINE]Can only be constructed in a [COLOR_YELLOW]Coastal City[ENDCOLOR]. Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Harbor[ENDCOLOR] and cannot be built if the city has an [COLOR_NEGATIVE_TEXT]Aquaculture Lab or Undersea Mining Platform[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]If you found the Civil Gem Corporation,[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_GOLDEN_AGE] Golden Age Points.'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_STRATEGY', 'Artificial Reefs are Future Era buildings that boost Science and Culture in your city.'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_PEDIA', 'Artificial reefs are man-made underwater structures that foster marine life, curb erosion, block trawling, and even improve surf. From antiquity—Persians damming channels to block pirates, Romans sealing harbors in the Punic Wars—to today’s climate era, reefs remain tools for habitat restoration. With warming seas damaging natural coral, societies turn to engineered reefs to help repair fragile ecosystems.'),

-- Undersea Mining Platform
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING', 'Undersea Mining Platform'),
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION] Production and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold on worked Coast/Ocean tiles.[NEWLINE][NEWLINE][ICON_RES_OIL] Oil: +1[ICON_PRODUCTION] +1[ICON_GOLD] +1[ICON_RESEARCH][NEWLINE][ICON_RES_WHALE] Whales: +1[ICON_PRODUCTION] +1[ICON_GOLD] +1[ICON_RESEARCH][NEWLINE][ICON_RES_NANOMAT] Nanomaterials: +1[ICON_PRODUCTION] +1[ICON_GOLD] +1[ICON_RESEARCH][NEWLINE][NEWLINE]For each incoming [ICON_INTERNATIONAL_TRADE] Trade Route to this city, both cities gain +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Can only be constructed in a [COLOR_YELLOW]Coastal City[ENDCOLOR]. Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Harbor[ENDCOLOR] and cannot be built if the city has an [COLOR_NEGATIVE_TEXT]Aquaculture Lab or Artificial Reef[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]If you found the Centauri Development Corporation,[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION] Production.'),
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING_STRATEGY', 'A Future Era building that boosts Production and Gold yields.'),
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING_PEDIA', "Ever-improving robotics and drones opened access to Earth’s harshest environments. The seafloor’s manganese nodules and other resources were long untouched due to difficulty; now tele-operated and autonomous systems mine them at industrial scale. However, waste and industrial presence can conflict with aquaculture efforts."),

-- Server Hub
('TXT_KEY_BUILDING_FW_SERVER_HUB', 'Server Hub'),
('TXT_KEY_BUILDING_FW_SERVER_HUB_HELP', 'The Server Hub is a core Future Era building that lets a city specialize in dedicated servers for Science, Culture, Economy, or Production.'),
('TXT_KEY_BUILDING_FW_SERVER_HUB_STRATEGY', 'Construct a Server Hub to unlock specialized servers later.'),
('TXT_KEY_BUILDING_FW_SERVER_HUB_PEDIA', "Networking ordinary computers into shared servers transformed business, research, and industry by making vast data accessible to nearly everyone. Early networks were organized around centralized hubs that granted users access and sharing—foundations of today’s information age."),

-- Fungal Agrigenomics
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS', 'Xenofungus Agriculture Lab'),
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS_HELP', 'Spawns nearby tiles each with [COLOR_POSITIVE_TEXT]5[ENDCOLOR] [ICON_RES_XENO_FUNGUS] Xenofungus. Build a Cultivation improvement on them to harvest the resource.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Research Lab[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS_STRATEGY', '+4 [ICON_RESEARCH] Science and +4 [ICON_CULTURE] Culture in the city. Build the Lab to obtain [ICON_RES_XENO_FUNGUS] Xenofungus.'),
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS_PEDIA', 'The Xenofungus Lab applies functional genomics to discover fungal enzymes for industrial and environmental uses. Targeting evolutionarily diverse fungi that thrive in extremes, the program identifies biodegradation, bioremediation, and biocatalysis pathways. Agricultural genomics continues to drive sustainable productivity, linking genetic markers to traits that inform breeding and cultivation decisions.'),

-- Genemod Lab
('TXT_KEY_BUILDING_FW_GENE_LAB', 'Genetic Engineering Lab'),
('TXT_KEY_BUILDING_FW_GENE_LAB_HELP', 'When a [ICON_CITIZEN] Citizen grows, bank [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] of the [ICON_FOOD] Food used toward the next Citizen. [COLOR:105:105:105:255](Stacks with Aqueduct.)[ENDCOLOR] All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Genetic Engineering Labs[ENDCOLOR] provide an additional +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD] Food.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress by [COLOR_POSITIVE_TEXT]2[ENDCOLOR].[NEWLINE][NEWLINE][ICON_RES_HORSE] Horse: +2[ICON_FOOD][NEWLINE][ICON_RES_COW] Cattle: +2[ICON_FOOD][NEWLINE][ICON_RES_SHEEP] Sheep: +2[ICON_FOOD][NEWLINE][ICON_RES_DEER] Deer: +2[ICON_FOOD][NEWLINE][ICON_RES_BISON] Bison: +2[ICON_FOOD][NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Research Lab[ENDCOLOR].[NEWLINE][NEWLINE]Requires [ICON_RES_HORSE] Horses x[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_GENE_LAB_STRATEGY', 'Build the GenEng Lab to produce GMOs that raise Food from [ICON_RES_COW][ICON_RES_DEER][ICON_RES_HORSE][ICON_RES_SHEEP][ICON_RES_BISON].'),
('TXT_KEY_BUILDING_FW_GENE_LAB_PEDIA', 'As genome sequencing enabled precise selection and editing, genetic engineering moved from modest crop and livestock tweaks to targeted redesign. Risk alleles were removed, resilience increased, and entirely new organisms were crafted for fast growth and specific climates. Medicine and war soon adopted similar tooling: resistant soldiers, organ biobanks, and experimental augmentations. Together, sequencing and engineering became a technological singularity for civilization.'),

-- World Security
('TXT_KEY_BUILDING_FW_WORLD_SECURITY', 'International Security Bureau'),
('TXT_KEY_BUILDING_FW_WORLD_SECURITY_HELP', '+20 [ICON_SPY] City Security.[NEWLINE][NEWLINE][ICON_CITY_STATE] City-State [COLOR_CYAN]Ally[ENDCOLOR] bonus: +1 [ICON_SPY] City Security.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress, [ICON_GOLD] Poverty, [ICON_RESEARCH] Illiteracy, and [ICON_CULTURE] Boredom by [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_WORLD_SECURITY_STRATEGY', 'Police Stations slow hostile spy actions. A Digital Police HQ requires a Police Station in the city.'),
('TXT_KEY_BUILDING_FW_WORLD_SECURITY_PEDIA', 'INTERPOL coordinates cross-border crime fighting via national central bureaus (“International Security Bureaus”). It enables joint investigations into cybercrime, terror, finance, and narcotics, and runs real-time information sharing. Advanced network security and data analytics bolster responses to modern threats while training and standards support prevention and rule of law.'),
('TXT_KEY_BUILDING_FW_WORLD_SECURITY_DUMMY', 'INTERPOL National Central Bureau (Dummy)'),
('TXT_KEY_BUILDING_FW_WORLD_SECURITY_DUMMY_HELP', 'Each copy grants +1 City Security. Count is controlled by script.'),

-- Autoplant
('TXT_KEY_BUILDING_FW_AUTOPLANT', 'Autoplant'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION] Production per [ICON_CITIZEN] 5 Citizens in the city. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Autoplants[ENDCOLOR] yield an additional +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress and [ICON_URBANIZATION] Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Factory[ENDCOLOR].[NEWLINE][NEWLINE]Requires [ICON_RES_OIL] Oil x[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_STRATEGY', 'An upgraded classic Factory that greatly increases [ICON_PRODUCTION] Production.'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_PEDIA', 'As autonomy advanced, hazardous industrial tasks increasingly moved from humans to machines. Fully autonomous facilities raised productivity and protected health, especially as e-commerce spread end-to-end automated fulfillment.'),

-- Nanomaterial Plant
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT', 'Nanomaterials Plant'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_HELP', 'Provides [ICON_RES_NANOMAT] Nanomaterials x[COLOR_POSITIVE_TEXT]5[ENDCOLOR].[NEWLINE][NEWLINE][ICON_RES_IRON] Iron: +2[ICON_PRODUCTION][NEWLINE][ICON_RES_COAL] Coal: +2[ICON_PRODUCTION][NEWLINE][ICON_RES_OIL] Oil: +2[ICON_PRODUCTION][NEWLINE][ICON_RES_NANOMAT] Nanomaterials: +2[ICON_PRODUCTION][NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Research Lab[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]If you found Hexon Refining Corporation,[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_PRODUCTION] Production.'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_STRATEGY', 'Lay the groundwork to extract nanomaterials from coal, oil, and iron; provides Nanomaterials.'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_PEDIA', 'The Nanomaterials Plant refines rare and specialty resources into nanoscale structures for advanced equipment. Moving beyond carbon-only processes, it leverages rare-earth and novel chemistries to mass-produce high-performance nanomaterials—the backbone of a future civilization.'),

-- Ecosanctuary
('TXT_KEY_BUILDING_FW_ECOSANCTUARY', 'Eco-Sanctuary'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_HELP', '+[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION] Production on worked Camps, Brazilwood Camps, Lumber Mills, Nature Reserves, and Eco-Villages. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Eco-Sanctuaries[ENDCOLOR] yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture. Converts [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of city [ICON_PRODUCTION] Production each turn into [ICON_CULTURE] Culture. +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_TOURISM] Tourism in the city.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom and [ICON_RELIGION] Religious Unrest by [COLOR_POSITIVE_TEXT]1[ENDCOLOR].[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Pharmacy[ENDCOLOR] and cannot be built if the city has a [COLOR_NEGATIVE_TEXT]Vertical Farm[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_STRATEGY', 'If your plan integrates forests and wetlands, Eco-Sanctuaries are strong for Production and Culture. Modernize Camps, Brazilwood Camps, Lumber Mills, Reclaimed Land, Nature Reserves, and Eco-Communities for extra yields. Also grants Happiness.'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_PEDIA', 'Communities with strong eco-ethos built “sanctuaries” within their neighborhoods: semi-natural reserves that connect residents to wildlife daily. These spaces became cultural centers inspiring art, music, and literature.'),

-- Cryptobank
('TXT_KEY_BUILDING_FW_CRYPTOBANK', 'Cryptocurrency Exchange'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold per [ICON_CITIZEN] 5 Citizens. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Cryptocurrency Exchanges[ENDCOLOR] yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold. +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD] Gold on worked Villages.[NEWLINE][NEWLINE]Purchasing units/buildings with [ICON_GOLD] Gold costs [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] less.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty by [COLOR_POSITIVE_TEXT]2[ENDCOLOR].[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Stock Exchange[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]If you found Seed Trade Company,[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_GOLD] Gold.'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_STRATEGY', 'Build to increase city Gold output and improve small cities’ yields.'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_PEDIA', 'Though designed to bypass central authorities, crypto quickly reached Wall Street. By the early 2020s, major banks and payment platforms offered custody and trading, integrating digital assets into mainstream finance.'),

-- VR Training
('TXT_KEY_BUILDING_FW_VR_TRAINING', 'VR Training Grounds'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_HELP', '+[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION] Production on worked Communication Arrays; newly trained units receive +[COLOR_POSITIVE_TEXT]25[ENDCOLOR] Experience. +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_SILVER_FIST] Military Supply.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] and from [ICON_FOOD]/[ICON_PRODUCTION] Distress by [COLOR_POSITIVE_TEXT]1[ENDCOLOR].[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Military Academy[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_STRATEGY', 'Build to increase XP gains and raise Military Supply.'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_PEDIA', 'As equipment and battlefields grew more complex, simulated environments became essential to grant soldiers realistic experience without real risk.'),

-- Virtual Museum
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM', 'Metaverse Museum'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_TOURISM] Tourism per [ICON_CITIZEN] 4 Citizens. +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_TOURISM] Tourism per [ICON_GREAT_WORK] Great Work in the city. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Metaverse Museums[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture. +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_GREAT_ARTIST] Great Artist generation. Contains 2 [ICON_GREAT_WORK] Great Work of Art slots.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom by [COLOR_POSITIVE_TEXT]2[ENDCOLOR].[NEWLINE][NEWLINE]Theming: [ICON_CULTURE] Culture +6.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Museum[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]If you found Giorgio Armie Corporation,[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CULTURE] Culture.'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_STRATEGY', 'A Future Era culture building. One Great Work/Artifact slot and no prior culture buildings required.'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_PEDIA', 'Global networks and NFTs enabled provenance-backed digital collections. With immersive VR, demand for native digital art surged, and virtual museums let audiences access, verify, and manage masterpieces—reshaping how culture is consumed.'),

-- E-Commerce Server
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER', 'E-Commerce Server'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold per [ICON_CITIZEN] 2 Citizens.[NEWLINE]+[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_GREAT_MERCHANT] Great Merchant generation.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty and [ICON_URBANIZATION] Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Stock Exchange[ENDCOLOR]; cannot be built if the city has a [COLOR_NEGATIVE_TEXT]Research, Cloud, or Entertainment Server[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_STRATEGY', 'Boosts city Gold and Great Merchant generation.'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_PEDIA', 'E-commerce integrates product databases, payments, logistics tracking, and customer support into a secure, personalized platform. With big-data analytics and AI, storefronts evolved into global digital trade backbones.'),

-- Entertainment Server
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER', 'Entertainment Server'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture per [ICON_CITIZEN] 2 Citizens.[NEWLINE]+[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_GREAT_PEOPLE] Great Culture Person generation.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom and [ICON_URBANIZATION] Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Broadcast Tower[ENDCOLOR]; cannot be built if the city has a [COLOR_NEGATIVE_TEXT]Research, Cloud, or E-Commerce Server[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_STRATEGY', 'Raises Culture and the rate of Great Musicians, Artists, and Writers.'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_PEDIA', 'From YouTube to global streaming, entertainment servers reshaped media consumption with high-throughput delivery, recommendation engines, and rights management—now a keystone of the digital economy.'),

-- Cloud Computing
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING', 'Cloud Server'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION] Production per [ICON_CITIZEN] 2 Citizens.[NEWLINE]+[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_GREAT_ENGINEER] Great Engineer generation.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress and [ICON_URBANIZATION] Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Factory[ENDCOLOR]; cannot be built if the city has a [COLOR_NEGATIVE_TEXT]Research, Entertainment, or E-Commerce Server[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_STRATEGY', 'Raises Production and Great Engineer generation.'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_PEDIA', 'Cloud servers centralized storage and enabled distributed computing, unlocking instant, secure collaboration for individuals and enterprises—and becoming the backbone of modern productivity.'),

-- Research Server
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER', 'Research Server'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH] Science per [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CITIZEN] Citizens.[NEWLINE]+[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_GREAT_SCIENTIST] Great Scientist generation.[NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_RESEARCH] Illiteracy and [ICON_URBANIZATION] Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Research Lab[ENDCOLOR]; cannot be built if the city has an [COLOR_NEGATIVE_TEXT]Entertainment, E-Commerce, or Cloud Server[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_STRATEGY', 'Boosts Science and Great Scientist generation.'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_PEDIA', 'What began as academic networks became ubiquitous infrastructure. Researchers now access data, analyze results, and exchange papers worldwide in days, accelerating discovery and peer review.'),

-- Nanomaterials Extractor
('TXT_KEY_BUILDING_FW_CONVERTER', 'Nanomaterials Extractor (Coal)'),
('TXT_KEY_BUILDING_FW_CONVERTER_OIL', 'Nanomaterials Extractor (Oil)'),
('TXT_KEY_BUILDING_FW_CONVERTER_IRON', 'Nanomaterials Extractor (Iron)'),
('TXT_KEY_BUILDING_FW_CONVERTER_HELP', 'Worked [ICON_RES_COAL]Coal, [ICON_RES_OIL]Oil, and [ICON_RES_IRON]Iron resource tiles in the city yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD]Gold. [NEWLINE][NEWLINE]Provides [ICON_RES_NANOMAT]Nanomaterials [COLOR_POSITIVE_TEXT]4[ENDCOLOR]. [NEWLINE][NEWLINE]Requires at least one improved [COLOR_YELLOW][ICON_RES_COAL]Coal, [ICON_RES_OIL]Oil, or [ICON_RES_IRON]Iron[ENDCOLOR] resource tile in the city, and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Nanomaterials Plant[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY', 'If you own the required resources and a Nanomaterials Plant, you can convert them into additional Nanomaterials.'),
('TXT_KEY_BUILDING_FW_CONVERTER_PEDIA', 'Advances in nanomaterials engineering further improved the development of nanomaterials. While the original nanomaterials plants required very specific environments and feedstocks for their work and were not true nanotechnology, more sophisticated nano-scale machines helped make the process easier and less resource-intensive. Raw materials such as coal or oil can be fed into specially built converters where nano-scale machines faithfully work to transform them into useful nanomaterials. Although there were concerns that these early nanomachines might run amok by converting any organic matter they found into nanomaterials, their comparatively simple construction still required protected environments to operate and made it unlikely they would survive long in the wild. Their programming and design also remained relatively limited: they could convert only certain materials into other materials, and could not, for example, make copies of themselves. Even so, in societies with stronger ecological thinking, Nanomaterials Extractors were viewed as a serious risk to the environment.'),

-- Nanomaterials Munitions Plant
('TXT_KEY_BUILDING_FW_NANOFORGE', 'Nanomaterials Munitions Plant'),
('TXT_KEY_BUILDING_FW_NANOFORGE_HELP', 'Worked Industrial Complexes in the city yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD]Gold. Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training all military units. [ICON_SILVER_FIST]Unit supply cap +[COLOR_POSITIVE_TEXT]1[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Nanomaterials Plant[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_NANOFORGE_STRATEGY', 'Build a Nanomaterials Munitions Plant to accelerate military unit production. Benefits [COLOR_POSITIVE_TEXT]Industrial Zones[ENDCOLOR] (Industrial Zones add a [ICON_PRODUCTION]Production bonus to nearby Manufactories).'),
('TXT_KEY_BUILDING_FW_NANOFORGE_PEDIA', 'A Nanomaterials Munitions Plant is a dedicated facility that uses nanotechnology to produce new materials and equipment. Nanomaterials act on metals, machinery, computers, and more, improving alloy toughness and manufacturing capability—enhancing the economy and production overall. These advantages soon led to weapons development, and as part of that effort this plant was constructed.'),

-- Particle Accelerator
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR', 'Particle Accelerator'),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science for every 5 [ICON_CITIZEN]Citizens in the city. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Particle Accelerators[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science. Worked Research Complex tiles in the city yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_RESEARCH]Science. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_RESEARCH]Illiteracy by [COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Research Lab[ENDCOLOR] in the city. [NEWLINE][NEWLINE]If the [COLOR_POSITIVE_TEXT]Phyracite Materials[ENDCOLOR] corporation is founded, +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_RESEARCH]Science.'),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_STRATEGY', 'Construct a Particle Accelerator to increase a city’s science output. Also boosts science yields of advanced Research Complexes.'),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_PEDIA', 'Particle accelerators are key scientific instruments for investigating physical phenomena under high-energy conditions. They aid further research in fields such as quantum theory and astrophysics. A particle accelerator accelerates charged particles like electrons or protons through strong electric or magnetic fields to impart large kinetic energies. This enabled clarification of the four fundamental forces (strong, weak, gravitational, electromagnetic), and the discovery of the Higgs boson—responsible for mass—was a major milestone achieved via accelerators, offering crucial clues to understanding the universe.'),

-- Vertical Farm
('TXT_KEY_BUILDING_FW_VERTICAL_FARM', 'Vertical Farm'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_HELP', 'Worked Farms, Plantations, Terrace Farms, Land Reclamations, and Hydroponic Districts in the city yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_FOOD]Food. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Vertical Farms[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science. Each turn provides [ICON_RESEARCH]Science equal to [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of the city’s [ICON_FOOD]Food. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_RESEARCH]Illiteracy and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Pharmacy[ENDCOLOR] in the city and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Xenofungus Agriculture Lab[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_STRATEGY', 'Maximize yields by constructing all farms, terraces, plantations, and hydroponic facilities; the building grants extra food and a science bonus.'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_PEDIA', 'Vertical farming is the practice of producing food in vertically stacked layers, on vertically inclined surfaces, and/or integrated into other structures. Modern vertical farming uses Controlled-Environment Agriculture (CEA) technology to manage all environmental factors, including artificial lighting, climate control (humidity, temperature, gases), and fertigation. Some vertical farms use greenhouse-like technology that augments natural light with artificial illumination and metallic reflectors. Integrated into major urban structures, these farms provide local food sources independent of climate and soil conditions.'),

-- Laboratory Animal Research Center
('TXT_KEY_BUILDING_FW_BIOTEST_CENTER', 'Laboratory Animal Research Center'),
('TXT_KEY_BUILDING_FW_BIOTEST_CENTER_HELP', 'Provides [ICON_RES_XENO_FUNGUS]Xenospore [COLOR_POSITIVE_TEXT]4[ENDCOLOR]. City loses [COLOR_NEGATIVE_TEXT]6[ENDCOLOR] [ICON_FOOD]Food. [NEWLINE][NEWLINE][ICON_RES_HORSE]Horses: +2 [ICON_GOLD]Gold[NEWLINE][ICON_RES_COW]Cattle: +2 [ICON_GOLD]Gold[NEWLINE][ICON_RES_SHEEP]Sheep: +2 [ICON_GOLD]Gold[NEWLINE][ICON_RES_DEER]Deer: +2 [ICON_GOLD]Gold[NEWLINE][ICON_RES_BISON]Bison: +2 [ICON_GOLD]Gold[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Genetic Engineering Lab[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_HORSE]Horses ×[COLOR_NEGATIVE_TEXT]3[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIOTEST_CENTER_STRATEGY', 'Co-locate animal models, precision fermentation, and tissue engineering to accelerate xenospore acquisition and commercialization. Best in cities rich in animal resources for faster payback. Note the ethical cost—the work entails the loss of many laboratory animals.'),
('TXT_KEY_BUILDING_FW_BIOTEST_CENTER_PEDIA', 'A city-scale R&D complex unifying vivariums (gnotobiotic and conventional), precision fermentation/enzyme processes, tissue engineering/organoid platforms, and GxP quality lines. Standardized breeding/culture, in vivo/in vitro equilibrium tests, and genetic/metabolic process optimization improve growth, resilience, and nutritional profiles, linking outputs to food, pharma, and materials. All experiments follow biosafety and animal-ethics guidelines (3Rs, IACUC), yet the pursuit of verifiable knowledge and therapies inevitably costs many animal lives. At the city level, feed and facility upkeep can reduce short-term [ICON_FOOD]food leeway, but in animal-resource hubs, valorization of by-products and tech transfer boost economic returns and research efficiency. The complex anchors food security, biomedical innovation, and biosourced materials.'),

-- Biofactory
('TXT_KEY_BUILDING_FW_BIOFACTORY', 'Biofactory'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_HELP', 'Worked Grassland and Plains tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Biofactories[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD]Food, and all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Marine Bio-Industrial Complex[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science. Each turn converts [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of the city’s [ICON_PRODUCTION]Production into [ICON_FOOD]Food. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Factory[ENDCOLOR] in the city and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Borehole, Geothermal Plant, or Marine Bio-Industrial Complex[ENDCOLOR]. Cannot be built on [COLOR_NEGATIVE_TEXT]Snow[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_STRATEGY', 'Biofactories increase production and food. Cities with mostly Plains and Grassland gain one extra production per tile and a bonus conversion to food.'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_PEDIA', 'Early industrialization scaled GM crops and microbial fermentation into large processes, expanding food and material production. Biofactories accelerated soil nutrient cycles and mass-cultured target biota, enabling stable output even in harsh environments. Though some warned of abnormally accelerated mutations, industrial efficiency prevailed. [NEWLINE]Today, biofactories replace or augment heavy industry with closed-loop bioprocesses, cutting environmental burden and promoting resource circularity. Microbial consortia, recombinant cells, and precision fermentation produce proteins, fatty acids, amino acids, and biopolymer precursors; by-products are recycled into energy and feedstock via anaerobic digestion and gas fermentation. This system minimizes waste, decarbonizes industry, and marks a new industrial revolution that turns life itself into a tool of production.'),

-- Marine Bio-Industrial Complex
('TXT_KEY_BUILDING_FW_OCEAN_BIOHUB', 'Marine Bio-Industrial Complex'),
('TXT_KEY_BUILDING_FW_OCEAN_BIOHUB_HELP', 'Worked Coast and Ocean tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Biofactories[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD]Food, and all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Marine Bio-Industrial Complex[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science. Each turn converts [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] of the city’s [ICON_PRODUCTION]Production into [ICON_FOOD]Food and [ICON_RESEARCH]Science (separately). [NEWLINE][NEWLINE]Can be built only in a [COLOR_YELLOW]Coastal City[ENDCOLOR]. Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Harbor[ENDCOLOR] and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Borehole, Geothermal Plant, or Biofactory[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_OCEAN_BIOHUB_STRATEGY', 'A factory-based marine processing hub that boosts coastal tile productivity and converts part of production into food and science for long-term growth. Data from marine survey craft and pilot piers feeds Xeno–metal interface studies, laying groundwork for Xen–Al processes and bio-quantum foundries. Mutually exclusive with Biofactory due to infrastructure/regulatory conflict.'),
('TXT_KEY_BUILDING_FW_OCEAN_BIOHUB_PEDIA', 'A Marine Bio-Industrial Complex is a complex hub that discovers, cultivates, and refines metabolites from microalgae, seaweeds, and marine microbes at industrial scale. It integrates photobioreactors and fermentation lines with downstream processes (membrane filtration, chromatography) and GMP/HACCP facilities for cosmetics/food, building a pipeline from prototypes to mass production. Core outputs include functional cosmetic ingredients (fucoidan, alginate, carrageenan; antioxidant/anti-inflammatory compounds; MAAs for UV shielding), nutraceuticals (EPA/DHA omega-3s, marine polyphenols), medical/diagnostic enzymes including extremozymes, as well as eco-friendly surfactants and anti-biofouling materials—standardized via pilot validation and QA to connect into global supply chains. [NEWLINE]As a front line for new materials, the park develops and commercializes marine-derived biopolymers (PHA/PHB), chitin/chitosan and algal cellulose, alginate aerogels, mussel-mimetic bioadhesives, and low-toxicity antifouling coatings. With nutrient recovery/reuse, CO₂ capture/utilization, zero-liquid-discharge processes, and seagrass/seaweed “nurseries” for blue-carbon restoration, it ensures sustainability. Academia-industry partnerships and standards/certifications expand regional economies and exports; accumulated data and know-how seed future advanced bioprocesses and high-tech materials.'),

-- Biotech Institute
('TXT_KEY_BUILDING_FW_BIOTECH_CENTER', 'Biotech Institute'),
('TXT_KEY_BUILDING_FW_BIOTECH_CENTER_HELP', 'Spawns tiles near the city that contain [ICON_RES_XENO_FUNGUS]Xenospore ×[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Worked Plains tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold; worked Grassland tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD]Food; worked Desert, Snow, and Tundra tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. [NEWLINE][NEWLINE]Requires both a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Xenofungus Agriculture Lab[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Genetic Engineering Lab[ENDCOLOR] in the city, and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Deep-Earth Physics Institute[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIOTECH_CENTER_STRATEGY', 'Boosts yields in climates favorable for GMO cultivation (Grassland and Plains).'),
('TXT_KEY_BUILDING_FW_BIOTECH_CENTER_PEDIA', 'The Biotech Institute arose from attempts to redesign the relationship between soil and living organisms. Initially, the goal was to genetically enhance soil organisms and microbes to accelerate nutrient cycles even in harsh environments, raising yields across Plains, Grassland, Desert, Snow, and Tundra. [NEWLINE]As research progressed, unexpected reactions and peculiar mineral-biological interactions deep within the soil were reported. Some saw these as mere acceleration of mutation, while others argued a deeper, unknown transformative process was at play. [NEWLINE]Soil ecosystems began to amplify their intrinsic traits beyond the limits of any single terrain, yielding gains everywhere. Though controversial, the lab achieved clear results in soil improvement and resource increase, drawing international attention. Researchers also found hints that microscopic bonding structures in soil subtly entangle life’s quantum properties with matter, suggesting entirely new avenues of progress.'),

-- Bio-Augmentation Clinic
('TXT_KEY_BUILDING_FW_BIO_AUG_CLINIC', 'Bio-Augmentation Clinic'),
('TXT_KEY_BUILDING_FW_BIO_AUG_CLINIC_HELP', 'For every 10 [ICON_CITIZEN]Citizens in the city, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD]Food and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PEACE]Faith. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]VR Training Grounds[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. [NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Recon and Gunpowder units, and grants [COLOR_PLAYER_PURPLE]Implant[ENDCOLOR] promotion to Gunpowder units. [ICON_SILVER_FIST]Unit supply cap +[COLOR_POSITIVE_TEXT]1[ENDCOLOR]. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION]Backwards and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Hospital[ENDCOLOR] in the city and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Launch Facility[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIO_AUG_CLINIC_STRATEGY', 'Speeds production of new organic units (Clone Trooper, Mutant, Bio-Augmented Infantry, Super-Soldier, Bio Trooper) and grants the Implant promotion to Gunpowder units. Cannot be built in a city with a Launch Facility.'),
('TXT_KEY_BUILDING_FW_BIO_AUG_CLINIC_PEDIA', 'With rapid advances in bio-augmentation, specialized implant clinics multiplied to meet a fast-growing market. Beyond dental and orthopedic implants, these facilities provide artificial organs (heart, lungs, kidneys, liver) and precision bioprosthetics. As neural interfaces and nano-scale materials integrate, clinics no longer merely restore lost function but proactively enhance human capability. People can replace aging or damaged parts to live healthier and longer lives, and in some cases receive implants specialized for military or professional fields, conferring exceptional physical or cognitive abilities. Thus, implant clinics have become cornerstones of longevity, augmentation, and biomedical innovation in future society.'),

-- Network Backbone
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE', 'Network Backbone'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_HELP', 'Your civilization’s Unique Improvements and Generators yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold. [NEWLINE]All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Research Servers[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science; all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Entertainment Servers[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE]Culture; all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]E-commerce Servers[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold; all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Cloud Servers[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. Each turn converts [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] of the city’s [ICON_CULTURE]Culture into [ICON_GOLD]Gold and [ICON_TOURISM]Tourism (separately). [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION]Backwards and [ICON_GOLD]Poverty by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_STRATEGY', 'Install a Network Backbone to increase the yields of each server type in the city.'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_PEDIA','Globalization and explosive advances in communications have fundamentally changed human life. Masterpieces and cultural heritage from around the world have moved into the virtual realm for anyone to access, and with AR/MR people can enjoy new experiences anywhere on Earth. To support these massive data flows, large data centers rose worldwide, enabling big-data research that opened new possibilities across science, industry, and culture. The Network Backbone is not a mere conduit but key infrastructure connecting cities and people, accelerating the flow of information and ideas. Yet finite bandwidth and space still force prioritization. In the future, a society’s influence will hinge on how effectively it secures and operates these backbones.'),

-- Launch Facility
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY', 'Launch Facility'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science for every 10 [ICON_CITIZEN]Citizens in the city. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Spaceship Factories[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. [NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Recon and Gunpowder units; grants [COLOR_PLAYER_PURPLE]Orbital Guidance[ENDCOLOR] promotion to Recon units. City [ICON_AIRPORT]Air units capacity +[COLOR_POSITIVE_TEXT]1[ENDCOLOR]. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION]Backwards and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Factory[ENDCOLOR] in the city and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Bio-Augmentation Clinic[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_STRATEGY', 'Increases the city’s production and science output.'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_PEDIA', 'Early rockets could only loft small payloads to the edge of space, but safely placing people and heavy cargo into orbit required vastly more sophisticated facilities. The Launch Facility—combining huge assembly buildings with maintenance, fueling, and propulsion systems—became a strategic hub mobilizing scientists and engineers nationwide. [NEWLINE]Over time, launch infrastructure evolved: reusable platforms slashed access costs, rapid-turn boosters and electromagnetic launchers diversified ground methods, and sea-based/mobile pads entered service. The paradigm shifted from state monopoly to an industry-wide endeavor. [NEWLINE]Today, the Launch Facility is more than a rocket pad: it uplifts aerospace, scientific research, and urban industry all at once—a complex innovation center essential to humanity’s transition from Earth-bound civilization to a spacefaring one.'),

-- 'Biofuel Refinery
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', 'Biofuel Refinery (Wheat)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_RICE', 'Biofuel Refinery (Rice)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_BANANA', 'Biofuel Refinery (Banana)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_MAIZE', 'Biofuel Refinery (Maize)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', 'The city must have the corresponding [ICON_RES_WHEAT]Wheat, [ICON_RES_RICE]Rice, [ICON_RES_BANANA]Bananas, or [ICON_RES_MAIZE]Maize. City loses [COLOR_NEGATIVE_TEXT]4[ENDCOLOR] [ICON_FOOD]Food. [NEWLINE][NEWLINE]Provides [ICON_RES_OIL]Oil [COLOR_POSITIVE_TEXT]4[ENDCOLOR]. [NEWLINE][NEWLINE]Requires at least one improved [COLOR_YELLOW][ICON_RES_WHEAT]Wheat[ENDCOLOR], [COLOR_YELLOW][ICON_RES_RICE]Rice[ENDCOLOR], [COLOR_YELLOW][ICON_RES_BANANA]Bananas[ENDCOLOR], or [COLOR_YELLOW][ICON_RES_MAIZE]Maize[ENDCOLOR] tile in the city. [NEWLINE][NEWLINE][ICON_RES_WHEAT]Wheat: +2 [ICON_GOLD]Gold[NEWLINE][ICON_RES_RICE]Rice: +2 [ICON_GOLD]Gold[NEWLINE][ICON_RES_MAIZE]Maize: +2 [ICON_GOLD]Gold[NEWLINE][ICON_RES_BANANA]Bananas: +2 [ICON_GOLD]Gold[NEWLINE][NEWLINE]Limited to [COLOR_YELLOW]3 per civilization[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY', 'The city gains 4 Oil but loses some food.'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', 'Amid mounting environmental damage, Porsche accelerated research into e-fuels. E-fuel is a synthetic liquid fuel produced from water (H₂O) and carbon dioxide (CO₂), powered by renewable electricity (solar and wind). In principle it can make combustion engines carbon-neutral, because engine CO₂ emissions correspond to the CO₂ captured from air to produce the fuel. As a substitute for fossil fuels, e-fuel can immediately reduce emissions and, depending on availability, be blended with existing fuels. It also leverages current storage and transport infrastructure. Regions rich in clean electricity can store that potential in e-fuel for long-distance transport.'),

-- Geothermal Plant
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY', 'Geothermal Plant'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold for each Mountain within 3 tiles of the city. Worked Hill tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Boreholes[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold, and all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Geothermal Plants[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. Each turn converts [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] of [ICON_PRODUCTION]Production into [ICON_GOLD]Gold and [ICON_PRODUCTION]Production (separately). [NEWLINE][NEWLINE]Requires a [COLOR_YELLOW]Mountain within 2 tiles[ENDCOLOR] of the city. Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Factory[ENDCOLOR] and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Borehole[ENDCOLOR] or [COLOR_NEGATIVE_TEXT]Biofactory[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_STRATEGY', 'Increases production and gold yields from worked Hills and nearby Mountains.'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_PEDIA', 'A geothermal plant draws fluid from underground reservoirs to generate steam, which drives turbines to produce electricity. The three major technologies are dry steam, flash steam, and binary cycle. The choice depends on the state and temperature of the underground fluid (steam or water) and shapes the plant design.'),

-- Borehole
('TXT_KEY_BUILDING_FW_BOREHOLE', 'Borehole'),
('TXT_KEY_BUILDING_FW_BOREHOLE_HELP', 'Worked Mines, Wells, and Quarries yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Boreholes[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold, and all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Geothermal Plants[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. Each turn converts [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of [ICON_PRODUCTION]Production into [ICON_GOLD]Gold. [NEWLINE][NEWLINE]The city must [COLOR_NEGATIVE_TEXT]not have Mountains[ENDCOLOR], and cannot have a [COLOR_NEGATIVE_TEXT]Biofactory[ENDCOLOR] or [COLOR_NEGATIVE_TEXT]Geothermal Plant[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BOREHOLE_STRATEGY', 'Modernizes all worked Mines and Quarries, increasing production and gold yields.'),
('TXT_KEY_BUILDING_FW_BOREHOLE_PEDIA', 'While the 20th century saw record depths like the 12-km Kola Superdeep and various deep-sea drilling efforts, only in the 21st century did advanced materials and equipment make boreholes widespread. Practical depths now reach resources rare in nature, even magma. Borehole programs enhance mine and geothermal outputs, supplying abundant minerals and energy.'),

-- Deep-Earth Physics Institute
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH', 'Deep-Earth Physics Institute'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science for each Mountain within 3 tiles of the city; worked Hill tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science. Worked Desert, Tundra, and Snow tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold. [NEWLINE][NEWLINE]Provides [ICON_RES_NANOMAT]Nanomaterials [COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Nanomaterials Plant[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Particle Accelerator[ENDCOLOR] in the city, and cannot be built if there is an [COLOR_NEGATIVE_TEXT]Biotech Institute[ENDCOLOR]. [NEWLINE][NEWLINE]If the [COLOR_POSITIVE_TEXT]Phyracite Materials[ENDCOLOR] corporation is founded, +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_RESEARCH]Science.'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_STRATEGY', 'Secure nanomaterials and, through advanced physics, lay groundwork for orbital engineering and nuclear photonics—foundations for quantum engineering.'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_PEDIA', 'The Deep-Earth Physics Institute grew from humanity’s attempts to probe Earth’s heart through deep-drilling experiments. [NEWLINE]Originally built to explore high-temperature, high-pressure geothermal environments, it evolved into a multidisciplinary hub spanning neutrinos, dark matter, quantum mechanics, and cosmic physics. Extreme geologic conditions exposed rare strata, and researchers collected rare-earth elements and nanomaterial precursors formed under immense pressure and heat. The institute now stands at the confluence of geology, energy engineering, and advanced materials science, laying the groundwork for future antimatter research and quantum-technology breakthroughs.'),

-- Cloning Lab
('TXT_KEY_BUILDING_FW_CLONE_LAB', 'Cloning Lab'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_HELP', 'Provides [ICON_RES_XENO_FUNGUS]Xenospore [COLOR_POSITIVE_TEXT]1[ENDCOLOR]. Spawns 1 free [COLOR_YELLOW]Clone Trooper[ENDCOLOR]. On completion, city gains [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CITIZEN]Citizens immediately. [NEWLINE][ICON_SILVER_FIST]Unit supply cap increases by [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of the city’s [ICON_CITIZEN]population. [NEWLINE][NEWLINE]Great People generation in the city +[COLOR_POSITIVE_TEXT]10%[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Genetic Engineering Lab[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_STRATEGY', 'Grants a free Clone Trooper.'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_PEDIA', 'Early cloning experiments were performed on farm animals. Because of ethical issues around human cloning, the most likely near-term use is to increase the productivity of animal herds.'),

-- Information Management Hub
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB', 'Information Management Hub'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_HELP', 'Worked Holy Sites, Landmarks, Nature Reserves, and Communication Towers in the city yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CULTURE]Culture and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold. City [ICON_VP_WRITER]Writers, [ICON_VP_ARTIST]Artists, and [ICON_VP_MUSICIAN]Musicians yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE]Culture. +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE]Culture per Great Work. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_CULTURE]Illiteracy (Free Culture) and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] in the city and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Distribution Hub, Metroplex Hub, or Virtual Reality Hub[ENDCOLOR]. [NEWLINE][NEWLINE]If the [COLOR_POSITIVE_TEXT]Giorgio Armier[ENDCOLOR] corporation is founded, +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CULTURE]Culture.'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_STRATEGY', 'A powerful Future Era building for cultural victories. Requires a Server Hub. The city must not have an [COLOR_NEGATIVE_TEXT]Information Management Hub, Distribution Hub, or Simulation Hub[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_PEDIA', 'The rise of generative AI completely changed how cities distribute information and culture. The Information Management Hub interprets citizen requests and situational data in real time, pushing items into a “generate–review–publish” pipeline: news, performances, exhibit guides, and educational content can be programmed and localized within minutes for each community feed. [NEWLINE][NEWLINE]Running atop the [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR]’s compute and storage, it includes public validation/feedback loops to reduce model bias. Centralized curation raises quality and safety but concentrates editorial power. As many cities enjoy “instantly generated culture” via these hubs, citizen panels and public data charters help maintain balance.'),

-- Virtual Reality Hub
('TXT_KEY_BUILDING_FW_SIMULATION_HUB', 'Virtual Reality Hub'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_HELP', 'Worked Academies and Research Complexes in the city yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_RESEARCH]Science and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold. City [ICON_VP_SCIENTIST]Scientists yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_RESEARCH]Illiteracy and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] in the city and cannot be built if there is an [COLOR_NEGATIVE_TEXT]Information Management Hub, Metroplex Hub, or Distribution Hub[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_STRATEGY', 'A strong Future building for boosting science and reducing build time for cyber units. Requires a Server Hub.'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_PEDIA', 'The Virtual Reality Hub is a city-scale simulation center powered by generative AI. It recreates urban systems—transport, water, power, education, health—as digital twins; feed citizen needs or policy proposals and it instantly synthesizes thousands of scenarios. Results are demonstrated via immersive VR: students explore curricula, researchers test hypotheses, and companies validate operations and plans. [NEWLINE][NEWLINE]Running on a distributed compute mesh tied to the [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR], it maintains trust via data-protection and model-audit procedures. Thanks to generative AI, the “plan–simulate–revise” loop shrinks drastically, letting cities learn fast and change safely. Spanning education, research, and entertainment, it makes real-world decisions more transparent and helps citizens participate directly in consensus building.'),

-- Nanomaterial Conversion Extractor (Oil)
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO', 'Nanomaterial Conversion Extractor (Oil)'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_HELP', 'Provides [ICON_RES_NANOMAT]Nanomaterials [COLOR_POSITIVE_TEXT]4[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS]Xenospore [COLOR_NEGATIVE_TEXT]5[ENDCOLOR] and [ICON_RES_OIL]Oil [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_STRATEGY', 'Uses oil-based carbon chains to convert xenospore into nanomaterials. Low efficiency causes some losses.'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_PEDIA', 'Marine bio research shows that oil’s carbon chains interact with xenospore proteins/peptides to induce adsorption/ordering in aluminum-coated metal reactors. Under RF stimulation and thermo-solvent conditions, the complex rearranges into carbon-doped nanolattices, from which some lattices can be extracted as [ICON_RES_NANOMAT] nanomaterials. [NEWLINE][NEWLINE] However, dehydration, gas release, and structural defects during reaction make losses inevitable. Useful for emergency resupply, but long-term resource sourcing is more efficient.'),

-- Nanomaterial Conversion Extractor (Coal)
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2', 'Nanomaterial Conversion Extractor (Coal)'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_HELP', 'Provides [ICON_RES_NANOMAT]Nanomaterials [COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS]Xenospore [COLOR_NEGATIVE_TEXT]4[ENDCOLOR] and [ICON_RES_COAL]Coal [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_STRATEGY', 'Uses coal as a catalyst to convert xenospore into nanomaterials. Efficiency is very low but can consume excess coal.'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_PEDIA', 'Biofactory research observed that coal’s high-temperature/high-pressure reactivity increases xenospore mutation rates to produce nanomaterials. However, coal’s impurities and heavy by-products make the process extremely inefficient.'),

-- Synthetic Xenospore Foundry
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF', 'Synthetic Xenospore Foundry'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_HELP', 'Provides [ICON_RES_XENO_FUNGUS]Xenospore [COLOR_POSITIVE_TEXT]5[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials [COLOR_NEGATIVE_TEXT]5[ENDCOLOR] and [ICON_RES_ALUMINUM]Aluminum [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_STRATEGY', 'Cultivates synthetic xenospore using nanolattices and metal interfaces. Some losses are unavoidable.'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_PEDIA', 'Bioengineering shows that injecting organic matter into [ICON_RES_NANOMAT] nanolattices aligned on aluminum frameworks can reproduce xenospore expression patterns—an artificial replication of metal–organic reactivity observed in marine bio studies. [NEWLINE][NEWLINE] Aluminum is required to build the framework.'),

-- Humanoid Robot Factory
('TXT_KEY_BUILDING_FW_HUMONOID_FORGE','Humanoid Robot Factory'),
('TXT_KEY_BUILDING_FW_HUMONOID_FORGE_HELP','For every 10 [ICON_CITIZEN]Citizens in the city, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE]Culture. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Nanomaterials Munitions Plants[ENDCOLOR] provide an additional +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. [NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Armored and Siege units. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]2[ENDCOLOR] Specialists no longer increase [ICON_HAPPINESS_3]Unhappiness from [ICON_URBANIZATION]Urbanization. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Nanomaterials Munitions Plant[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_HUMONOID_FORGE_STRATEGY','A powerful Future building that boosts unit production through robot manufacturing.'),
('TXT_KEY_BUILDING_FW_HUMONOID_FORGE_PEDIA','Standardized humanoid mass-production cities finish assembly using alloy frames, high-torque actuators, and synthetic dermis from automated plants and nanomaterials munitions lines. Joints, power, and sensor modules follow common specs for easy body swaps and upgrades; software is updated OTA via data towers. [NEWLINE] Gait, manipulation, and balance algorithms are validated immediately, and simulator halls load city-specific mission packs (logistics, maintenance, disaster response, perimeter). Units ship with safety rules and priority policies to avoid conflicts with human workers, and learn local environmental maps and cultural assets. [NEWLINE][NEWLINE]The Humanoid Robot Factory is infrastructure for redesigning processes and living spaces around human–robot collaboration, not mere labor replacement. Standard platforms raise public-service quality and automate operation/maintenance of heavy and siege equipment, accelerating deployment to the battlefield.'),

-- Telepresence Hub
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB', 'Telepresence Hub'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_HELP', 'For each [COLOR_POSITIVE_TEXT]1[ENDCOLOR] [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Virtual Reality Hub[ENDCOLOR] in your civilization: +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science. For each [COLOR_POSITIVE_TEXT]1[ENDCOLOR] [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Information Management Hub[ENDCOLOR]: +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE]Culture. For each [COLOR_POSITIVE_TEXT]1[ENDCOLOR] [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Metroplex Hub[ENDCOLOR]: +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold. For each [COLOR_POSITIVE_TEXT]1[ENDCOLOR] [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Distribution Hub[ENDCOLOR]: +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Network Backbone[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_STRATEGY', 'Increases the corresponding yield by 1 for each Hub you own. Requires a Network Backbone.'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_PEDIA', 'With generative AI spreading and general-purpose humanoids commercialized, the Telepresence Hub evolved from a simple telemeeting facility into a “humanoid ground station.” It matches workers, clinicians, instructors, and guides to humanoid bodies; integrates visual/audio/haptic feedback, balance control, latency compensation, and safety geofencing; and enables remote field work. All procedures to deploy/recover/service humanoid “links” are auto-scheduled, and generative AI instantly composes SOPs, dialogue scripts, and training scenarios. [NEWLINE][NEWLINE]Building the hub activates a combined system with humanoids, enabling shift work “embodied” on-site without commuting, night maintenance, and swift response to contingencies. It runs on the [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR]’s compute/storage network and guarantees safety and accountability via logging, audits, and access control. Citizens reduce travel time and gain higher immersion/productivity; the city gains a new operational model that minimizes labor gaps and risk exposure.'),

-- Distribution Hub
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB', 'Distribution Hub'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_HELP', 'Worked Manufactories and Industrial Zones in the city yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION]Production and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold. City [ICON_VP_ENGINEER]Engineers yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production. [NEWLINE][NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when constructing buildings. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION]Backwards and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] in the city and cannot be built if there is an [COLOR_NEGATIVE_TEXT]Information Management Hub, Metroplex Hub, or Virtual Reality Hub[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_STRATEGY', 'A powerful Future building for increasing production and speeding up construction. The city must not have an [COLOR_NEGATIVE_TEXT]Information Management Hub, Metroplex Hub, or Simulation Hub[ENDCOLOR], and must have a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_PEDIA', 'The Distribution Hub unifies production, warehousing, and delivery into a single generative pipeline. Models learn orders, weather, events, and input prices to synthesize procurement, allocation, and routes, while micro-fulfillment, drones, and autonomous vehicles follow “generated routes.” Standard parts are pre-assembled; custom parts are printed on-site, cutting lead times to minutes. [NEWLINE][NEWLINE]Operated on a digital-logistics twin, the hub anticipates bottlenecks and reallocates staff/equipment; it auto-designs packaging specs, load sequences, and return flows. With generative AI’s transparent chain, firms reduce inventory and citizens enjoy faster, cheaper supply.'),

-- Metroplex Hub
('TXT_KEY_BUILDING_FW_METROPLEX_HUB', 'Metroplex Hub'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_HELP', 'Worked Villages and Towns in the city yield +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_GOLD]Gold. City [ICON_VP_MERCHANT]Merchants yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold. [NEWLINE][NEWLINE]Costs [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] less [ICON_GOLD]Gold to purchase units or invest in buildings. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_GOLD]Poverty and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hub[ENDCOLOR] in the city and cannot be built if there is an [COLOR_NEGATIVE_TEXT]Information Management Hub, Distribution Hub, or Virtual Reality Hub[ENDCOLOR]. [NEWLINE][NEWLINE]If the [COLOR_POSITIVE_TEXT]Seed Trade Co.[ENDCOLOR] corporation is founded, +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_GOLD]Gold.'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_STRATEGY', 'Greatly helps gold generation and reduces the gold cost of purchases.'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_PEDIA', 'At the heart of a megacity, the Metroplex Hub uses generative AI to synthesize and coordinate transport, commerce, and housing patterns simultaneously. Demand forecasts fuse with real-time feeds to generate routes, signals, and congestion-mitigation scenarios in seconds; pop-up retail, events, and night markets are automatically planned and placed. With “prompt-driven urban planning,” districts become proposable rather than fixed, and citizen feedback becomes training data for the next deployment. [NEWLINE][NEWLINE]Embedded regulations and public-interest rules keep safety, noise, and environmental limits in check. The resulting operational scenarios cut traffic and inefficiency, while culture, commerce, and leisure are optimally placed by time of day—realizing a “living metroplex.”'),

-- High-Energy Advanced Materials Lab
('TXT_KEY_BUILDING_FW_METAMATERIALS_CENTER', 'High-Energy Advanced Materials Lab'),
('TXT_KEY_BUILDING_FW_METAMATERIALS_CENTER_HELP', 'Provides [ICON_RES_URANIUM]Uranium [COLOR_POSITIVE_TEXT]2[ENDCOLOR] and [ICON_RES_NANOMAT]Nanomaterials [COLOR_POSITIVE_TEXT]1[ENDCOLOR]. [NEWLINE][NEWLINE]Your civilization must have at least [COLOR_POSITIVE_TEXT]125[ENDCOLOR] [ICON_CITIZEN]Citizens. [NEWLINE]Limited to [COLOR_YELLOW]3 per civilization[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_METAMATERIALS_CENTER_STRATEGY', 'Provides 2 Uranium and 1 Nanomaterials. Up to 3 may be built. Requires at least 125 total population to construct a nuclear fuel reprocessing facility.'),
('TXT_KEY_BUILDING_FW_METAMATERIALS_CENTER_PEDIA', 'The High-Energy Advanced Materials Lab conducts next-generation materials experiments across extreme regimes: ultra-high temperature/pressure and intense radiation. Focus areas include exploring candidate compositions for room-temperature superconductivity (e.g., LK-99-like leads) and interfacial/film critical behavior; compositional recombination at the elemental level (alloying, doping, defect engineering); specialty tungsten processing (ultra-high melting point, high heat flux, neutron shielding); and design of high-entropy alloys and metamaterials. [NEWLINE][NEWLINE]An autonomous lab couples automated synthesis with property measurement; generative AI drives inverse design and active learning to rapidly scan the vast composition–process–structure–property space. Using MBE/CVD/ALD films, ion implantation, laser DED and PBF metal AM, HPHT synthesis, and quenching to capture metastable phases, the lab identifies tungsten-rhenium/tantalum ultra-refractory alloys, SiC/MAX ceramics, and high-performance superconducting interconnects. [NEWLINE][NEWLINE]Outcomes feed fusion reactor thermal shielding and plasma-facing materials, space-environment structures, radiation-hard electronics, and superconducting power/levitation systems—pushing the limits of the city’s energy, industry, and research infrastructure.'),

-- Mycoprotein Vats
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS', 'Mycoprotein Vats'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD]Food for every 4 [ICON_CITIZEN]Citizens in the city. [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of [ICON_FOOD]Food is carried over after a new [ICON_CITIZEN]Citizen is born. [COLOR:105:105:105:255](Stacks with Aqueducts.)[ENDCOLOR][NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]1[ENDCOLOR] Specialist no longer increases [ICON_HAPPINESS_3]Unhappiness from [ICON_URBANIZATION]Urbanization. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Medical Lab[ENDCOLOR] in the city. [NEWLINE][NEWLINE]If the [COLOR_POSITIVE_TEXT]2K Foods[ENDCOLOR] corporation is founded, +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_FOOD]Food.'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_STRATEGY', 'A Future Era building that helps cities grow faster and combat poverty and unhappiness.'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_PEDIA', 'Though many methods have been developed to increase food production, population growth in some regions threatened to outpace yields even with improved farms and hydroponics. Some communities turned to mass production of nutritionally complete substitutes by synthesizing proteins and fibers fit for human consumption. These substitutes provided adequate nutrition but often lacked the taste and texture of real foods. Even so, many mycoprotein products were the only affordable nutrition available and helped sustain millions of lives.'),

-- Orbital Solar Reflector Power Satellite
('TXT_KEY_BUILDING_FW_SOLAR_REFLECTOR', 'Orbital Solar Reflector Power Satellite'),
('TXT_KEY_BUILDING_FW_SOLAR_REFLECTOR_HELP', 'On completion, celebrate a [COLOR_POSITIVE_TEXT]15[ENDCOLOR]-turn [ICON_HAPPINESS_1]We Love the King Day. Deals +[COLOR_POSITIVE_TEXT]5[ENDCOLOR] [ICON_STRENGTH]damage to enemy air units conducting airstrikes on this city. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]1[ENDCOLOR] Specialist no longer increases [ICON_HAPPINESS_3]Unhappiness from [ICON_URBANIZATION]Urbanization. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Immune to destruction by nuclear weapons.[ENDCOLOR] Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Launch Facility[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_SOLAR_REFLECTOR_STRATEGY', 'Can be paired with Lagrange Commercial/Industrial/Research districts to boost science, production, or gold.'),
('TXT_KEY_BUILDING_FW_SOLAR_REFLECTOR_PEDIA', 'An Orbital Solar Reflector Power Satellite is an orbital platform with large deployable mirrors (reflective films) and beam-steering optics that reflect sunlight to ground receiving areas to augment insolation (winter/night/peak correction), or generate power on-orbit and transmit it wirelessly to ground rectennas—a hybrid system. Satellites schedule beams along target regions from sun-synchronous or geostationary orbits, finely tuning reflectance density, altitude, and time windows to supply energy tailored to agriculture, cities, and industry. [NEWLINE][NEWLINE]Standard modules include deployable reflectors and radiators, phased-array beam steering, and optical safety protocols (aviation/astronomy blind zones, ecological exposure limits). They operate via the city’s [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Launch Facility[ENDCOLOR] and networks. With modular expansion, they support materials/thermal research (science), orbital manufacturing/maintenance (production), and commercial transmission/tourism (gold), bolstering terrestrial grids and greatly improving energy security and resilience.'),

-- Transgenic Nursery
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY', 'Transgenic Nursery'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_HELP', '[COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of [ICON_FOOD]Food is carried over after a new [ICON_CITIZEN]Citizen is born.[COLOR:105:105:105:255](Stacks with Aqueducts.)[ENDCOLOR] For each worked Eco-Village in the city, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD]Food and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PEACE]Faith. Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Melee, Mounted, and Air Recon units. [NEWLINE][NEWLINE]Grants the [COLOR_PLAYER_PURPLE]Transgenics[ENDCOLOR] promotion to all [COLOR_POSITIVE_TEXT]Bio-line units[ENDCOLOR] [COLOR:105:105:105:255](Melee, Mounted, Gunpowder, Air Recon)[ENDCOLOR] produced in this city. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Xenofungus Agriculture Lab[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Genetic Engineering Lab[ENDCOLOR] in the city, and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Drone Hive[ENDCOLOR] or an [COLOR_NEGATIVE_TEXT]Aerospace Complex[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_STRATEGY', 'Accelerates science and the production of organic units. All units produced in the city do not expend movement when pillaging.'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_PEDIA', 'Studies on the spread of genetically modified plants and animals in existing ecosystems, coupled with advances in genetic modification and engineering, expanded efforts from aiding individual organisms to reshaping whole ecosystems. Transgenic nurseries served as testbeds for developing new self-sustaining ecologies that grow more efficiently and productively than those occurring naturally. Once results were satisfactory, these new ecologies were introduced into the wild, rapidly displacing prior ecosystems.'),

-- Bio-Computer
('TXT_KEY_BUILDING_FW_BIOCOMPUTER', 'Bio-Computer'),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_HELP', "All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Bio-Computers[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]5[ENDCOLOR] [ICON_RESEARCH]Science. City loses [COLOR_NEGATIVE_TEXT]6[ENDCOLOR] [ICON_FOOD]Food. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_RESEARCH]Illiteracy by [COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS]Xenospore ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR], [ICON_RES_ALUMINUM]Aluminum ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR], and [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR]. [NEWLINE][NEWLINE]Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Biotech Institute[ENDCOLOR] in the city."),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_STRATEGY', 'A “living compute core” combining xenospore with metal interfaces and nanolattices. Heavy food upkeep and maintenance, but dramatically accelerates scientific progress.'),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_PEDIA', "Bio-Computers originated in marine ecology research. Organic matter reactive to specific metals was observed to disrupt/amplify signaling in plants and algae; the spore-forming complex mediating this was identified via reactions with ‘xenospore.’ [NEWLINE][NEWLINE]Researchers focused on life’s quantum-scale information flows (ultrafine coherence and energy-transfer patterns), but converting these into circuits was difficult. Life generates quantum information but does not compute on its own. Via xenospore-induced variation, biopolymer networks could be rerouted—acting as a catalyst/mediator for data transduction. [NEWLINE][NEWLINE]Thus Aluminum served as a lightweight, conductive metal interface, and Nanomaterials as ordered nanolattices. Injecting xenospore-modified biomatter formed bio-inorganic composite nodes between metal and lattice; node state changes converted to electrical signals, enabling computation. Life wasn’t a semiconductor by itself—but with aluminum and nanolattices, it behaved like one. [NEWLINE][NEWLINE]Unlike classical silicon, this system excels at nonlinear optimization and adaptive learning. Early prototypes therefore required xenospore, aluminum, and nanomaterials together. Today they are viewed as precursors to next-generation ‘bio-quantum’ architectures."),

-- Tidal Port
('TXT_KEY_BUILDING_FW_TIDAL_PORT', 'Tidal Port'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_HELP', 'Worked Ocean tiles yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production and +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD]Gold. [NEWLINE][NEWLINE]Sea [ICON_INTERNATIONAL_TRADE]Trade Routes extend by [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] and yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD]Gold. [ICON_SILVER_FIST]Unit supply cap +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training naval units (excluding Carriers). [NEWLINE][NEWLINE]When a foreign [ICON_INTERNATIONAL_TRADE]sea trade route originating from this city completes, grants [ICON_TOURISM]Tourism based on current [ICON_CULTURE]Culture and [ICON_TOURISM]Tourism output. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Seaport[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR]. [NEWLINE][NEWLINE]If [COLOR_POSITIVE_TEXT]Centauri Development Corp.[ENDCOLOR] is founded, +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION]Production.'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_STRATEGY', 'A Future Era building requiring a Harbor. Improves sea trade range and gold, increases the value of water tiles and resources, boosts naval production, and raises unit supply.'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_PEDIA', 'As tidal power plants became common near coastal cities, many industries moved onto nearby floating platforms to exploit the energy. These platforms grew more sophisticated, evolving into complex linked structures centered on the power plant. Such commercial complexes became key sources of industry and commerce for coastal and island communities.'),

-- Geofront
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD', 'Geofront'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_HELP', 'Greatly increases the city’s [ICON_STRENGTH]Defense. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Military Base[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Strategic Defense System[ENDCOLOR] in the city. Cannot be built in a [COLOR_NEGATIVE_TEXT]Coastal City[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_STRATEGY', 'Massively increases city defense strength.'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_PEDIA', 'An extreme hardening of non-coastal cities. Beyond simple bunkers, the Geofront is a last redoubt with immense domes and multilayer barriers. Surface attacks are largely thwarted; inside lies a self-sufficient space sized for the whole city. Inspired by Evangelion’s Geofront, it serves as the ultimate defensive structure to shield citizens deep underground during total war.'),

-- Nano Minefield
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD', 'Nano Minefield'),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_HELP', 'Enemy naval and embarked units entering this city’s water tiles expend all movement. Enemy units ending their turn on this city’s Ocean tiles take [COLOR_NEGATIVE_TEXT]5 damage[ENDCOLOR], or [COLOR_NEGATIVE_TEXT]10 total[ENDCOLOR] if a minefield is present. [COLOR:105:105:105:255](Does not apply to Coast tiles.)[ENDCOLOR][NEWLINE][NEWLINE]Can be built only in a [COLOR_YELLOW]Coastal City[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_STRATEGY', 'A Future Era building available only with sufficient [ICON_RES_NANOMAT]Nanomaterials. Upgraded mines bolster city defense and HP and still slow enemy naval/embarked movement by 1 around the city’s water tiles, also dealing 5 HP damage each turn.'),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_PEDIA', 'Nano minefields are small but far deadlier than traditional ones. Equipped with “smart” brains that autonomously detect enemy vessels, contact with these bots is hard to avoid.'),

-- Drone Hive
('TXT_KEY_BUILDING_FW_DRONE_HIVE', 'Drone Hive'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_HELP', 'For each worked Generator in the city, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE]Culture. Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when constructing buildings. [NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Archer and Helicopter units. [NEWLINE][NEWLINE]Grants the [COLOR_PLAYER_PURPLE]Auto-Repair[ENDCOLOR] promotion to all [COLOR_POSITIVE_TEXT]Robotic-line units[ENDCOLOR] [COLOR:105:105:105:255](Archer, Helicopter, Armored, Siege)[ENDCOLOR] produced in this city. [NEWLINE][NEWLINE]Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Autoplant[ENDCOLOR] in the city, and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Transgenic Nursery[ENDCOLOR] or an [COLOR_NEGATIVE_TEXT]Aerospace Complex[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_STRATEGY', 'Boosts production and speeds construction of robotic units. Auto-Repair greatly helps robots on friendly territory.'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_PEDIA', 'As autonomous robots and drones became commonplace, cities needed dedicated facilities to maintain and monitor them. These specialized “drone hives” gave drones reliable home bases, enabling longer range and steadier operation—taking over tasks previously performed by people.'),

-- Skyrail Hub
('TXT_KEY_BUILDING_FW_SKYRAIL_HUB', 'Skyrail Hub'),
('TXT_KEY_BUILDING_FW_SKYRAIL_HUB_HELP', '[NEWLINE]Worked Villages and Towns in the city yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE]Culture and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_TOURISM]Tourism. Domestic [ICON_INTERNATIONAL_TRADE]trade routes originating here provide +[COLOR_POSITIVE_TEXT]8[ENDCOLOR] [ICON_FOOD]Food and +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION]Production. Land trade route range +[COLOR_POSITIVE_TEXT]25%[ENDCOLOR]. Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Fighter and Bomber units. [NEWLINE][NEWLINE]When a foreign [ICON_INTERNATIONAL_TRADE]land trade route originating from this city completes, grants [ICON_TOURISM]Tourism based on current [ICON_CULTURE]Culture and [ICON_TOURISM]Tourism output. [NEWLINE][NEWLINE]Requires a [ICON_CAPITAL][ICON_INDUSTRIAL_CONNECTED]capital–industrial rail connection, and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Coaling Station[ENDCOLOR] and [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Airport[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR]. [NEWLINE][NEWLINE]If [COLOR_POSITIVE_TEXT]Civil Gems Co.[ENDCOLOR] is founded, +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_GOLDEN_AGE]Golden Age points.'),
('TXT_KEY_BUILDING_FW_SKYRAIL_HUB_STRATEGY', 'Greatly boosts city production and gold in the Future Era. Requires a direct rail connection to the capital with rail tiles before construction—invest in rail first! Requires a Coal Depot.'),
('TXT_KEY_BUILDING_FW_SKYRAIL_HUB_PEDIA', 'The Skyrail Hub links maglev rail and air networks into a near-delayless transfer core between airport and city. Electromagnetic levitation and linear motors minimize noise and vibration while exceeding 500 km/h on city–airport shuttles. [NEWLINE][NEWLINE]Flights and maglevs mesh on minute-scale schedules, letting cargo and passengers flow like a single pipeline. Airport throughput multiplies, and trade and talent circulation accelerate dramatically. [NEWLINE][NEWLINE]Costly to build, but once active its air-rail efficiency and economic impact eclipse legacy transport, making the city a dense global hub for trade and tourism.'),

-- Lagrange Research Complex
('TXT_KEY_BUILDING_FW_LAGRANGE_RESEARCH', 'Lagrange Research Complex'),
('TXT_KEY_BUILDING_FW_LAGRANGE_RESEARCH_HELP', 'Spawns [COLOR_YELLOW][ICON_GREAT_SCIENTIST]a Great Scientist[ENDCOLOR]. [NEWLINE]City [ICON_VP_SCIENTIST]Scientists yield +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_RESEARCH]Science. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_RESEARCH]Illiteracy and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Immune to destruction by nuclear weapons.[ENDCOLOR] Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Orbital Solar Reflector Power Satellite[ENDCOLOR] in the city and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Lagrange Engineering Complex[ENDCOLOR] or [COLOR_NEGATIVE_TEXT]Lagrange Commercial District[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_LAGRANGE_RESEARCH_STRATEGY', 'Build a research complex to boost city science.'),
('TXT_KEY_BUILDING_FW_LAGRANGE_RESEARCH_PEDIA', 'With routine spaceflight and sub-orbital living zones, the Lagrange Research Complex became an “orbital research free zone,” free from ground regulation and climate risk. Microgravity, ultraclean vacuum, and sharp thermal cycling serve as variables for experiments—protein crystallization, superconductors/quantum materials, composite interfaces, radiation biology. Modules include quarantine/biocontainment and automated synthesis lines, syncing data in real time with ground labs. [NEWLINE][NEWLINE]Such orbital zones minimize disruptions from pandemics, conflict, pollution, and blackouts; orbital power/thermal systems and logistics docks enable 24/7 continuous runs.'),

-- Lagrange Engineering Complex
('TXT_KEY_BUILDING_FW_LAGRANGE_INDUSTRIAL', 'Lagrange Engineering Complex'),
('TXT_KEY_BUILDING_FW_LAGRANGE_INDUSTRIAL_HELP', 'Spawns [COLOR_YELLOW][ICON_GREAT_ENGINEER]a Great Engineer[ENDCOLOR]. [NEWLINE]City [ICON_VP_ENGINEER]Engineers yield +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_PRODUCTION]Production. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION]Backwards and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Immune to destruction by nuclear weapons.[ENDCOLOR] Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Orbital Solar Reflector Power Satellite[ENDCOLOR] in the city and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Lagrange Commercial District[ENDCOLOR] or [COLOR_NEGATIVE_TEXT]Lagrange Research Complex[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_LAGRANGE_INDUSTRIAL_STRATEGY', 'Construct an engineering complex to increase the city’s production output.'),
('TXT_KEY_BUILDING_FW_LAGRANGE_INDUSTRIAL_PEDIA', 'Designed as an “orbital industrial zone,” the Lagrange Engineering Complex handles sub-orbital manufacturing and servicing. In vacuum and microgravity it produces ultra-pure ZBLAN fiber, wafer epitaxy, controlled alloy solidification, metal additive manufacturing, and ultra-precision finishing; it also performs on-orbit services such as satellite maintenance, debris removal, and robotic docking. Large deployable workbays, robot arms, storage, and docks are tied to thermal/power buses, sharing standardized parts and QA with ground industry. [NEWLINE][NEWLINE]Freed from earthquakes, storms, heat waves, and blackouts, this zone cuts schedule/quality variance and supports long-cycle high-end manufacturing.'),

-- Lagrange Commercial District
('TXT_KEY_BUILDING_FW_LAGRANGE_COMMERCIAL', 'Lagrange Commercial District'),
('TXT_KEY_BUILDING_FW_LAGRANGE_COMMERCIAL_HELP', 'Spawns [COLOR_YELLOW][ICON_GREAT_MERCHANT]a Great Merchant[ENDCOLOR]. [NEWLINE]City [ICON_VP_MERCHANT]Merchants yield +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_GOLD]Gold. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_GOLD]Poverty and [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Immune to destruction by nuclear weapons.[ENDCOLOR] Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Orbital Solar Reflector Power Satellite[ENDCOLOR] in the city and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Lagrange Engineering Complex[ENDCOLOR] or [COLOR_NEGATIVE_TEXT]Lagrange Research Complex[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_LAGRANGE_COMMERCIAL_STRATEGY', 'Build a commercial district to increase the city’s wealth.'),
('TXT_KEY_BUILDING_FW_LAGRANGE_COMMERCIAL_PEDIA', 'An “orbital commercial zone” combining tourism, finance, and media. Observation domes, stay capsules, wide-FOV comm/relay arrays, and duty-free/convention facilities run space tourism and MICE together, while low-latency LOS networks link ground city services. With carbon-neutral power, circular waste systems, and security/quarantine/customs protocols, it serves global customers continuously. [NEWLINE][NEWLINE]Unlike ground districts vulnerable to climate, security, and regulatory shocks, the sub-orbital zone creates new demand—orbital tourism, real-time content, data relays—diversifying the city economy.'),

-- Aerospace Complex
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX', 'Aerospace Complex'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_HELP', 'For each worked Hydroponic District in the city, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold. Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when building Orbital Missiles, Carriers, and Spaceship parts. [NEWLINE][NEWLINE]Grants the [COLOR_PLAYER_PURPLE]Airborne Assault[ENDCOLOR] promotion to land units produced in the city. [NEWLINE][NEWLINE]City [ICON_AIRPORT]air unit capacity +[COLOR_POSITIVE_TEXT]4[ENDCOLOR]. Deals +[COLOR_POSITIVE_TEXT]10[ENDCOLOR] [ICON_STRENGTH]damage to enemy air units conducting airstrikes on this city. [NEWLINE][NEWLINE]Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Airport[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Launch Facility[ENDCOLOR] in the city, and cannot be built if there is a [COLOR_NEGATIVE_TEXT]Drone Hive[ENDCOLOR] or a [COLOR_NEGATIVE_TEXT]Transgenic Nursery[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_STRATEGY', 'Increases the city’s air unit capacity by 4 and adds 10 extra [ICON_STRENGTH]damage against airstrikes. +10% production toward Drone Fighters, Sub-orbital Bombers, Space Bombers, and Fighters. Requires an Airport.'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_PEDIA', 'With commercialization and space development, dedicated facilities for maintaining and servicing aerospace craft became necessary. These complexes often combine manufacturing and service buildings for vehicles and crews traveling to and from orbit.'),

-- Biogenesis Pod
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD', 'Biogenesis Pod'),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production per [COLOR_POSITIVE_TEXT]10[ENDCOLOR] military units in your civilization. [COLOR:105:105:105:255](Caps at 200 units.)[ENDCOLOR][NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Melee, Mounted, and Air Recon units, and grants the [COLOR_PLAYER_PURPLE]Genetic Modification[ENDCOLOR] promotion. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION]Backwards by [COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Transgenic Nursery[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS]Xenospore ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_STRATEGY', 'Grants the Genetic Modification promotion to Melee, Mounted, and Air Recon units trained in the city.'),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_PEDIA', 'As artificial gene chimeras became commonplace, mass-production facilities followed. During cultivation, pods allow dynamic gene modifications to match mission profiles, and often double as biological alteration centers. Though more basic than later birthing pods—with large-scale rather than fine edits—these pods could even be used for human modification.'),
('TXT_KEY_BUILDING_MIL10_STACK_DUMMY', 'Military x10(Dummy)'),

-- Mass Digester
('TXT_KEY_BUILDING_FW_MASS_DIGESTER', 'Mass Digester'),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD]Food for every 2 [ICON_CITIZEN]Citizens in the city. Provides [ICON_FOOD]Food on each city tile. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]2[ENDCOLOR] Specialists no longer increase [ICON_HAPPINESS_3]Unhappiness from [ICON_URBANIZATION]Urbanization. [NEWLINE][NEWLINE]Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Biotech Institute[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS]Xenospore ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_STRATEGY', 'Yields massive food the larger your population and territory are. Reduces unhappiness from urban density.'),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_PEDIA', 'As cities grew, some began to outstrip possible food supply. Historically this limited population, but research into converting weapons waste into semi-organic digestible feedstock proved a solution. Mixed nano-catalyst processes and engineered anaerobic digesters recover amino acids combined via biosynthesis into basic proteins. Archaeal proteases hydrolyze peptide bonds in the final stage, yielding bland yet nutritious paste. Inputs include many post-consumer materials: plastics, rubber, organometallics with organic ligands, alkene-derived polymers, etc. Archaea are common on this world and often correlate with xenomas masses. Throughput is moderate—biosynthesis is the bottleneck—and ongoing research streamlines and accelerates the process. There is a reason these industrial districts are dubbed “Mass Digesters.” Despite a preference for organic foods, protein paste is ubiquitous in many cities and even championed by some transhuman movements.'),

-- Bioenhancement Center
('TXT_KEY_BUILDING_FW_BIOMOD_TANK', 'Bioenhancement Center'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_HELP', 'Per [COLOR_POSITIVE_TEXT]10[ENDCOLOR] military units in your civilization: +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GREAT_GENERAL]Great General and [ICON_GREAT_ADMIRAL]Great Admiral points, and +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLDEN_AGE]Golden Age points. [COLOR:105:105:105:255](Caps at 200 units.)[ENDCOLOR][NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Recon, Gunpowder, Melee Naval, and Ranged Naval units, and grants the [COLOR_PLAYER_PURPLE]Bio-Mod[ENDCOLOR] promotion. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_CULTURE]Lack of Culture (Free) by [COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Bio-Augmentation Clinic[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Xenofungus Agriculture Lab[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS]Xenospore ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_STRATEGY', 'Increases production of Clone Troopers, Bio-Augmented Infantry, Bio Troopers, and Super-Soldiers. Melee, Mounted, Gunpowder, and Recon units receive the Bio-Mod promotion. Requires a Bio-Augmentation Clinic.'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_PEDIA', 'While the Bio-Augmentation Clinic allowed limited alterations, broader adaptations needed more advanced gear. The Bioenhancement Center performs extensive body modification, typically immersing subjects in suspension tanks for complex implants and whole-body changes. Common mods include stimulants for short-term regeneration and enhancements that boost combat ability.'),
('TXT_KEY_BUILDING_DUMMY_BIOMOD_POP_DUMMY', 'Bioenhance x10(Dummy)'),

-- Quantum Synchronization Link
('TXT_KEY_BUILDING_FW_QUANTUM_LINK', 'Quantum Synchronization Link'),
('TXT_KEY_BUILDING_FW_QUANTUM_LINK_HELP', '+[COLOR_POSITIVE_TEXT]25%[ENDCOLOR] [ICON_GREAT_SCIENTIST]Great Scientist generation in the city. [NEWLINE]All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Telepresence Hubs[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] each of [ICON_PRODUCTION]Production, [ICON_RESEARCH]Science, and [ICON_CULTURE]Culture, and each [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Bio-Computer[ENDCOLOR] provides +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_RESEARCH]Science. Global [ICON_HAPPINESS_1]Happiness +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Submarines. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Telepresence Hub[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Bio-Computer[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_QUANTUM_LINK_STRATEGY', 'Scans brainwaves at quantum precision to stream them into android doubles, letting users act as remote avatars. Improves cyber-unit and naval (non-carrier) production while boosting science and societal capacity.'),
('TXT_KEY_BUILDING_FW_QUANTUM_LINK_PEDIA', 'Born from advanced MRI and brainwave analytics, the Quantum Sync Link captures neural patterns with quantum-grade precision, synchronizing the user in real time to an android avatar. [NEWLINE][NEWLINE]The enormous quantum data requires near-Earth comms for stable sync—for now. Despite this, people can work and explore in new bodies, widening human activity across labor, research, military, and daily life.'),

-- Big Brother Control Center
('TXT_KEY_BUILDING_FW_BIGBROTHER_CONTROL', 'Big Brother Control Center'),
('TXT_KEY_BUILDING_FW_BIGBROTHER_CONTROL_HELP', '+20 [ICON_SPY]City Security. [NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Archer and Helicopter units. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3]Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION]Backwards, [ICON_GOLD]Poverty, [ICON_RESEARCH]Illiteracy, and [ICON_CULTURE]Lack of Culture (Free) by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each, and from [ICON_URBANIZATION]Urbanization by [COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]International Security Bureau[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_BIGBROTHER_CONTROL_STRATEGY', 'The Big Brother Control Center (digital policing system) slows hostile spies from harming the city. Requires the International Criminal Police Organization (INTERPOL) in the city.'),
('TXT_KEY_BUILDING_FW_BIGBROTHER_CONTROL_PEDIA', 'A specialized security system guarding both AI and human data across physical and digital realms. Beyond ordinary policing, it prevents and prosecutes crimes in both worlds. It blocks program hacking in virtual spaces and safeguards personal data via strong cryptography, real-time monitoring, and automated threat detection/response. It also educates users on safe data practices and recognizing/responding to attacks.'),

-- Fusion Reactor
('TXT_KEY_BUILDING_FW_FUSION_PLANT', 'Fusion Reactor'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_HELP', 'All Specialists in the city yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] each of [ICON_PRODUCTION]Production, [ICON_GOLD]Gold, [ICON_RESEARCH]Science, and [ICON_CULTURE]Culture. City conversion efficiency from [ICON_PRODUCTION]Production to other yields increases by [COLOR_POSITIVE_TEXT]20%[ENDCOLOR]. [ICON_GREAT_PEOPLE]Great People generation in the city +[COLOR_POSITIVE_TEXT]25%[ENDCOLOR]. Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Armored and Siege units. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Factory[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Deep-Earth Physics Institute[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_URANIUM]Uranium ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR] and [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR]. [NEWLINE][NEWLINE]If [COLOR_POSITIVE_TEXT]Hexon Refining Corp.[ENDCOLOR] is founded, +[COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_PRODUCTION]Production.'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_STRATEGY', 'City converts [ICON_PRODUCTION]Production to yields 20% more efficiently. [NEWLINE][NEWLINE] +25% [ICON_GREAT_PEOPLE]Great People rate in this city; all Specialists yield +1 [ICON_PRODUCTION], [ICON_GOLD], [ICON_RESEARCH], [ICON_CULTURE]. [NEWLINE][NEWLINE]Requires 1 [ICON_RES_URANIUM]Uranium.'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_PEDIA', 'Successful fusion power promises abundant, relatively clean energy. Key hurdles included acquiring deuterium/tritium (obtainable from seawater) and creating 100+ million-degree plasma using RF heating to overcome Coulomb repulsion. No material withstands such temperatures, so confinement exploits plasma’s magnetism: the tokamak traps plasma in a toroidal magnetic field to generate energy. Advances in AI control and ultra-refractory/HT superconducting materials enabled practical reactors and commercialization.'),

-- Asteroid Mining Base
('TXT_KEY_BUILDING_FW_ORBITAL_MINING', 'Asteroid Mining Base'),
('TXT_KEY_BUILDING_FW_ORBITAL_MINING_HELP', 'For every 10 [ICON_CITIZEN]Citizens in the city, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION]Production, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD]Gold, and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH]Science. [NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICONN_PRODUCTION]Production when training Recon, Gunpowder, Fighter, and Bomber units. [NEWLINE][NEWLINE]Provides [ICON_RES_IRON]Iron and [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]2[ENDCOLOR] Specialists no longer increase [ICON_HAPPINESS_3]Unhappiness from [ICON_URBANIZATION]Urbanization. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Immune to destruction by nuclear weapons.[ENDCOLOR] Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Orbital Solar Reflector Power Satellite[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_ORBITAL_MINING_STRATEGY', 'With space-based mining infrastructure, resource supply stabilizes, improving long-term production, economy, and research. Pairs well with electronics, energy, and space-focused cities.'),
('TXT_KEY_BUILDING_FW_ORBITAL_MINING_PEDIA', 'Asteroid mining—one of humanity’s first off-world industries—secures iron, nickel, PGMs, and rare engineering materials. Bases comprising orbital stations, haulers, and reprocessing modules diversify city economies, underpin high-value space industries, and serve as springboards for interplanetary expansion.'),

-- Orbital Hydroponics Habitat
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT', 'Orbital Hydroponics Habitat'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_HELP', '+[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD]Food per [ICON_VP_SCIENTIST]Scientist, [ICON_VP_ENGINEER]Engineer, and [ICON_VP_MERCHANT]Merchant in the city. Lagrange Research Complex [ICON_RESEARCH]Science +[COLOR_POSITIVE_TEXT]2[ENDCOLOR], Engineering Complex [ICON_PRODUCTION]Production +[COLOR_POSITIVE_TEXT]2[ENDCOLOR], Commercial District [ICON_GOLD]Gold +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. When the city grows, instantly provides [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] of current [ICON_PRODUCTION]Production as overflow. [NEWLINE]Provides +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR] [ICON_PRODUCTION]Production when training Orbital Missile and Carrier units. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]2[ENDCOLOR] Specialists no longer increase [ICON_HAPPINESS_3]Unhappiness from [ICON_URBANIZATION]Urbanization. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Immune to destruction by nuclear weapons.[ENDCOLOR] Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Aerospace Complex[ENDCOLOR] in the city. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_STRATEGY', 'Extremely costly to build, but greatly expands sustainable population via orbital food production.'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_PEDIA', 'The ultimate in artificial food production: an orbital habitat that farms in space. Early Lagrange facilities relied on costly surface shipments, but orbital habitats enabled near self-sufficiency, growing most food for crews. Initial outputs were only marginally better than mycoprotein supplements, yet over time hydroponic and aeroponic advances yielded diverse vegetables and plants to sustain long-duration crews.'),

-- Genetic Acceleration Center
('TXT_KEY_BUILDING_FW_GENETIC_EVOLUTION', 'Genetic Acceleration Center'),
('TXT_KEY_BUILDING_FW_GENETIC_EVOLUTION_HELP', '[ICON_RESEARCH] Science and [ICON_PRODUCTION] Production from the Biotechnology Center increase by [COLOR_POSITIVE_TEXT]2[ENDCOLOR].[NEWLINE][NEWLINE]Provides [ICON_RES_XENO_FUNGUS] Xenofungus [COLOR_POSITIVE_TEXT]3[ENDCOLOR].[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Transgenic Nursery[ENDCOLOR] in the city, and cannot be built if a [COLOR_NEGATIVE_TEXT]Central Command Center[ENDCOLOR] or [COLOR_NEGATIVE_TEXT]AI Network[ENDCOLOR] is present.'),
('TXT_KEY_BUILDING_FW_GENETIC_EVOLUTION_STRATEGY', 'Enhances the output of the Biotechnology Center and spawns Xenofungus around the city.'),
('TXT_KEY_BUILDING_FW_GENETIC_EVOLUTION_PEDIA', 'The Genetic Acceleration Center is a hub for cutting-edge research, designed to accelerate biotechnology and genetic projects. Scientists here decode genomes, discover new genetic functions, and advance modification techniques to strengthen traits or eliminate flaws. Applications range from crop and livestock improvement to advanced medical therapies. With its advanced facilities and expertise, the center plays a central role in pushing the frontiers of genetic science and channeling its results into civilization-wide progress.'),

-- Photosystems
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS', 'Photosystems'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_HELP', 'Generates [ICON_RES_XENO_FUNGUS] Xenofungus [COLOR_POSITIVE_TEXT]4[ENDCOLOR] near the city.[NEWLINE][NEWLINE]Forest tiles yield +1 [ICON_FOOD] Food, Jungle tiles yield +1 [ICON_PRODUCTION] Production, and Marsh tiles yield +1 [ICON_FOOD] Food and +1 [ICON_PRODUCTION] Production.'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_STRATEGY', 'Though expensive to maintain, it grants Xenofungus and boosts food, production, science, and culture. The new resources enable the creation of advanced mutagenic units.'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_PEDIA', 'Decades of photochemical study showed that thylakoid membranes in algae and cyanobacteria could be stimulated by ferredoxin and quinone injections. With genetic engineering, these traits were transferred to a wider range of plants, exponentially increasing the efficiency of Photosystems I and II in controlled growlabs. This breakthrough led to dramatic gains in food, production, and medicinal crops. Research continues, now focusing on pheophytin and carotenoids in local plant photosynthesis.'),

-- Birthing Pods
('TXT_KEY_BUILDING_FW_BIRTHING_PODS', 'Artificial Birthing Facility'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_HELP', 'Upon completion, the city gains [COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_CITIZEN] Citizens instantly. When population increases, [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] of the [ICON_FOOD] Food spent is carried over to the next Citizen. [COLOR:105:105:105:255](Stacks with Aqueduct.)[ENDCOLOR] Empire-wide [ICON_HAPPINESS_1] Happiness increases by [COLOR_POSITIVE_TEXT]3[ENDCOLOR].[NEWLINE][NEWLINE]One additional Specialist no longer causes [ICON_URBANIZATION] Urbanization Unhappiness.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND] Genetic Engineering Lab[ENDCOLOR] and a [COLOR_PLAYER_NETHERLANDS_BACKGROUND] Hospital[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_STRATEGY', 'A late-game growth facility that reduces food requirements for new Citizens. Provides +3 Citizens immediately upon construction.'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_PEDIA', 'As gene-editing became routine outside the body, artificial gestation followed. More children were born from artificial wombs, sparing parents physical pain and allowing constant monitoring to prevent complications. These evolved into specialized "birthing capsules," facilities capable of providing genetic and medical treatments throughout gestation. Unlike experimental chimera exo-capsules, birthing pods became a preferred and widely accepted method of childbirth.'),

-- AI Network
('TXT_KEY_BUILDING_FW_AI_NETWORK', 'AI Network'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_HELP', 'Defensive structures near the city gain +2 [ICON_RESEARCH] Science and +2 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Great People generation rate in the city increases by [COLOR_POSITIVE_TEXT]15%[ENDCOLOR].[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND] Drone Hive[ENDCOLOR] and cannot be built if a [COLOR_NEGATIVE_TEXT]Central Command Center[ENDCOLOR] or [COLOR_NEGATIVE_TEXT] Genetic Acceleration Center[ENDCOLOR] is present.'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_STRATEGY', 'Improves all defensive facilities of the city, boosting city HP, defense, and Happiness.'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_PEDIA', 'The rise of AI enabled more efficient operation of facilities and supported human scientific and cultural efforts. Some civilizations allowed AI to interlink into vast networks, despite public unease. These connections allowed AI to distribute tasks and collaborate, producing results far beyond what isolated systems could achieve.'),

-- Brain Uploading Facility
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING', 'Brain Uploading Facility'),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_HELP', 'A portion of the city’s [ICON_CITIZEN] Citizens are uploaded. Uploaded Citizens can no longer occupy tiles or Specialist slots, but for every remaining Citizen the city gains +1 [ICON_PRODUCTION] Production, +1 [ICON_RESEARCH] Science, +1 [ICON_GOLD] Gold, and +1 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Quantum Synchronization Link[ENDCOLOR][NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT]Nanomaterials ×[COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_STRATEGY', 'In overpopulated cities, where growth causes rising Unhappiness, citizens can contribute by uploading their minds into cyberspace.'),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_PEDIA', 'Advances in computing made it possible to replicate the human mind digitally, leading to the process of "brain uploading." These uploaded consciousnesses exist in a digital state, interacting with robots and virtual environments, free from biological needs. Some view this as modern euthanasia or abandonment of the elderly, sparking intense debate over its ethical implications.'),

-- Nucleonic Foundry
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY', 'Nucleonic Foundry'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_HELP', 'Each worked [ICON_RES_ALUMINUM] Aluminum and [ICON_RES_URANIUM] Uranium tile provides +4 [ICON_PRODUCTION] Production and +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Provides [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]8[ENDCOLOR].[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND] Fusion Reactor[ENDCOLOR].[NEWLINE][NEWLINE]Consumes 1 [ICON_RES_URANIUM] Uranium and 1 [ICON_RES_ALUMINUM] Aluminum.'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_STRATEGY', 'Provides 8 [ICON_RES_NANOMAT] Nanomaterials. Each worked Aluminum and Uranium source yields +4 Production and +2 Gold. Requires a Fusion Plant and 1 Uranium.'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_PEDIA', 'Helium-3, once obtainable only through tritium decay, became industrially viable with advanced technology. But the process demands vast energy and precision, requiring dedicated fusion reactors and heavy elements like uranium to catalyze synthesis. The produced alloys enable some of the largest and most awe-inspiring artificial structures humanity has ever built.'),

-- Utility Fog Generator
('TXT_KEY_BUILDING_FW_UTILITY_FOG', 'Utility Fog Generator'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_HELP', 'City [ICON_RANGE_STRENGTH] Ranged Attack Range increases by [COLOR_POSITIVE_TEXT]1[ENDCOLOR]. All buildings receive +20% [ICON_PRODUCTION] Production bonus when constructed.[NEWLINE][NEWLINE]City size requirements decrease by [COLOR_POSITIVE_TEXT]5%[ENDCOLOR].[NEWLINE][NEWLINE]Provides [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]3[ENDCOLOR].[NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND] Drone Hive[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_STRATEGY', 'Increases city defense and Happiness. Buildings are constructed 20% faster.'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_PEDIA', 'Swarming nanobots, able to bind together into physical structures, gave rise to "utility fog." Initially conceived as protection, their loose form could absorb and distribute impacts, but they also became tools for manufacturing and even human transport.'),

-- Central Command
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND', 'Central Command Center'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_HELP', 'Increases [ICON_GOLD] Gold and [ICON_CULTURE] Culture from Arcology by [COLOR_POSITIVE_TEXT]2[ENDCOLOR].[NEWLINE][NEWLINE]Provides [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]3[ENDCOLOR].[NEWLINE][NEWLINE]Requires an [COLOR_PLAYER_NETHERLANDS_BACKGROUND] Aerospace Complex[ENDCOLOR], and cannot be built if an [COLOR_NEGATIVE_TEXT]AI Network[ENDCOLOR] or [COLOR_NEGATIVE_TEXT] Genetic Acceleration Center[ENDCOLOR] exists.'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_STRATEGY', 'Boosts the yields of Arcology.'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_PEDIA', 'The Central Command Center acts as the heart of the Arcology, monitoring and regulating ecological balance. Using advanced sensors and systems, it tracks atmosphere, water, biodiversity, and energy consumption, making immediate adjustments to preserve stability. It also employs predictive modeling to prepare for future threats, ensuring sustainable survival for the city’s population.'),

-- Research Exchange
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1', 'Research Exchange'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND] Research Labs[ENDCOLOR] gain +2 [ICON_RESEARCH] Science; [COLOR_PLAYER_NETHERLANDS_BACKGROUND] Medical Labs[ENDCOLOR] gain +2 [ICON_FOOD] Food.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_STRATEGY', 'Increases science from Research Labs and food from Medical Labs.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_PEDIA', 'Even minor contributors to the genomic mapping network benefitted through shared knowledge. Research labs advanced with new discoveries, while medical labs treated diseases more effectively.'),

-- Genetic Treatments
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2', 'Genetic Treatments'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_HELP', 'All cities gain +1 [ICON_CITIZEN] Citizen. Genetic Labs gain +2 [ICON_RESEARCH] Science.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_STRATEGY', 'Adds population across all cities and boosts science from Genetic Labs.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_PEDIA', 'Greater involvement in the genome project brought greater rewards. Expanded knowledge of the human genome enabled easier treatment of chronic and genetic diseases, improving quality of life significantly.'),

-- Global Network
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_1', 'Optical Network'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_1_HELP', 'All [COLOR_POSITIVE_TEXT]Server Hubs[ENDCOLOR] yield +1 [ICON_RESEARCH] Science, [ICON_PRODUCTION] Production, [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_GOLD] Gold.'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_1_STRATEGY','Boosts Server Hub output, offering balanced gains in science, culture, production, faith, and gold even for minimal contributors.'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_1_PEDIA','The global optical network connects server hubs worldwide, enhancing speed and stability of data transfer. Even civilizations with minor contributions gain access to pooled knowledge and innovation, strengthening research and industry across the board.'),

-- Global Data Center
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_2', 'Data Center'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_2_HELP', 'All [COLOR_POSITIVE_TEXT]Network Nexuses[ENDCOLOR] yield +2 [ICON_RESEARCH] Science, +2 [ICON_CULTURE] Culture, and +2 [ICON_GOLD] Gold. Great People generation in all cities increases by [COLOR_POSITIVE_TEXT]10%[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_2_STRATEGY','Network Nexuses expand data processing capacity, generating more science, culture, and gold. Great People emerge more frequently.'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_2_PEDIA', 'Global Data Centers represent vast infrastructures for storing and analyzing massive datasets. They empower AI learning and large-scale simulations, accelerating scientific discovery, cultural creation, and economic efficiency. The result is an age of rapid innovation, producing more Great People and reshaping civilization’s future.'),

-- M-Type Asteroid → Deep Metal Deposits
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_1', 'Deep Metal Deposits'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_1_HELP', 'Provides [ICON_RES_IRON] Iron [COLOR_POSITIVE_TEXT]6[ENDCOLOR], [ICON_RES_COAL] Coal [COLOR_POSITIVE_TEXT]3[ENDCOLOR], and [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_1_STRATEGY', 'Secures steady supplies of industrial resources such as iron and coal.'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_1_PEDIA', 'Deep Metal Deposits tap into previously unreachable reserves of iron and coal buried within the Earth’s crust. Using advanced drilling and high-pressure control, civilizations unlock essential industrial and military materials.'),

-- S-Type Asteroid → Rare Alloy Materials
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_2', 'Rare Alloy Materials'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_2_HELP', 'Provides [ICON_RES_ALUMINUM] Aluminum [COLOR_POSITIVE_TEXT]4[ENDCOLOR], [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]3[ENDCOLOR], and [ICON_RES_URANIUM] Uranium [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_2_STRATEGY', 'Provides rare resources such as aluminum, nanomaterials, and uranium.'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_2_PEDIA', 'Rare Alloy extraction targets high-value resources in extreme environments. Aluminum, nanomaterials, and uranium fuel advanced industries, nuclear power, and nanotech, making them the focal point of global competition and cooperation.');

--===========================
-- Projects & League Resolutions
--===========================
INSERT INTO Language_en_US (Tag, Text) VALUES
-- Genome Project
('TXT_KEY_PROCESS_FW_GENOME_PROJECT','Genome Evolution Project'),
('TXT_KEY_PROCESS_FW_GENOME_PROJECT_HELP','Contributes this city''s [ICON_PRODUCTION] Production towards the Genome Evolution Project.'),
('TXT_KEY_LEAGUE_PROJECT_FW_GENOME_PROJECT','Genome Evolution Project'),
('TXT_KEY_LEAGUE_PROJECT_FW_GENOME_PROJECT_SPLASH','The Genome Evolution Project is an international cooperative effort to accelerate human evolution through scientific intervention rather than natural selection.'),
('TXT_KEY_WONDER_FW_GENOME_PROJECT_HELP','All specialists in the city provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] additional yield of their type.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_1','Research Exchange'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_1_HELP','All Research Labs provide +2 [ICON_RESEARCH] Science, and Medical Labs provide +3 [ICON_FOOD] Food.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_2','Gene Therapy'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_2_HELP','All cities gain +1 [ICON_CITIZEN] Population immediately, and Genetic Engineering Labs provide +2 [ICON_RESEARCH] Science.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_3','Applied Genomics'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_3_HELP','[ICON_CAPITAL]The Capital builds the [COLOR_POSITIVE_TEXT]Genome Innovation Center[ENDCOLOR] Wonder. ({TXT_KEY_WONDER_FW_GENOME_PROJECT_HELP})'),
('TXT_KEY_RESOLUTION_FW_GENOME_PROJECT','Genome Evolution Project'),
('TXT_KEY_RESOLUTION_FW_GENOME_PROJECT_HELP','Enacts the [COLOR_POSITIVE_TEXT]Genome Evolution Project[ENDCOLOR]. Once enacted, cities may contribute to the project by selecting it from the Production menu. When the project is completed, civilizations that contributed will receive rewards based on the amount of [ICON_PRODUCTION] Production invested.[NEWLINE][NEWLINE][ICON_TROPHY_GOLD]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_3_HELP}[NEWLINE][ICON_TROPHY_SILVER]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_2_HELP}[NEWLINE][ICON_TROPHY_BRONZE]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_1_HELP}[NEWLINE][NEWLINE]Requires that a civilization has researched [COLOR_RESEARCH_STORED]Biotechnology[ENDCOLOR] to be proposed.'),

-- Data Network
('TXT_KEY_PROCESS_FW_AI_DATANETWORK','Data Network'),
('TXT_KEY_PROCESS_FW_AI_DATANETWORK_HELP','Contributes this city''s [ICON_PRODUCTION] Production towards the Data Network Project.'),
('TXT_KEY_LEAGUE_PROJECT_FW_AI_DATANETWORK','Data Network'),
('TXT_KEY_LEAGUE_PROJECT_FW_AI_DATANETWORK_SPLASH','The Data Network is an international cooperative effort to interconnect global data infrastructures, efficiently allocating computing, storage, and transmission resources.'),
('TXT_KEY_WONDER_FW_AI_DATANETWORK_HELP','All E-Commerce Servers, Entertainment Hubs, Cloud Servers, and Research Servers provide +[COLOR_POSITIVE_TEXT]8[ENDCOLOR] to their yields. In addition, a free [ICON_GREAT_PEOPLE][COLOR_POSITIVE_TEXT]Great Person[ENDCOLOR] of your choice appears.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_1','Optical Communication Grid'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_1_HELP','All [COLOR_POSITIVE_TEXT]Server Hubs[ENDCOLOR] provide +1 [ICON_RESEARCH] Science, [ICON_PRODUCTION] Production, [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_GOLD] Gold.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_2','Data Center'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_2_HELP','All Network Nodes provide +2 [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, and [ICON_GOLD] Gold. In addition, Great Person generation in all cities is increased by [COLOR_POSITIVE_TEXT]10%[ENDCOLOR].'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_3','Technological Singularity'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_3_HELP','[ICON_CAPITAL]The Capital builds the [COLOR_POSITIVE_TEXT]Chat GPT[ENDCOLOR] Wonder. ({TXT_KEY_WONDER_FW_AI_DATANETWORK_HELP})'),
('TXT_KEY_RESOLUTION_FW_AI_DATANETWORK','Data Network'),
('TXT_KEY_RESOLUTION_FW_AI_DATANETWORK_HELP','Enacts the [COLOR_POSITIVE_TEXT]Data Network[ENDCOLOR] Project. Cities may contribute to the project by selecting it from the Production menu. Upon completion, civilizations that contributed will receive rewards based on the amount of [ICON_PRODUCTION] Production invested.[NEWLINE][NEWLINE][ICON_TROPHY_GOLD]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_3_HELP}[NEWLINE][ICON_TROPHY_SILVER]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_2_HELP}[NEWLINE][ICON_TROPHY_BRONZE]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_1_HELP}[NEWLINE][NEWLINE]Requires that a civilization has researched [COLOR_RESEARCH_STORED]AI: Generative[ENDCOLOR] to be proposed.'),

-- Mantle Exploration Project
('TXT_KEY_PROCESS_FW_DEEP_RESOURCE','Mantle Exploration Project'),
('TXT_KEY_PROCESS_FW_DEEP_RESOURCE_HELP','Contributes this city''s [ICON_PRODUCTION] Production towards the Mantle Exploration Project.'),
('TXT_KEY_LEAGUE_PROJECT_FW_DEEP_RESOURCE','Mantle Exploration Project'),
('TXT_KEY_LEAGUE_PROJECT_FW_DEEP_RESOURCE_SPLASH','The Mantle Exploration Project is an international cooperative effort to explore and secure rare metals and next-generation nanomaterials buried deep within the Earth and under the sea.'),
('TXT_KEY_WONDER_FW_DEEP_RESOURCE_HELP','A [ICON_GREAT_ENGINEER][COLOR_YELLOW]Great Engineer[ENDCOLOR] appears. All Nanomaterial Armories provide +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_1','Deep Metal Deposits'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_1_HELP','Gain [ICON_RES_IRON] Iron [COLOR_POSITIVE_TEXT]6[ENDCOLOR], [ICON_RES_COAL] Coal [COLOR_POSITIVE_TEXT]3[ENDCOLOR], and [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_2','Rare Alloy Materials'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_2_HELP','Gain [ICON_RES_ALUMINUM] Aluminum [COLOR_POSITIVE_TEXT]4[ENDCOLOR], [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]3[ENDCOLOR], and [ICON_RES_URANIUM] Uranium [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_3','Nano-Alloy Casting'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_3_HELP','[ICON_CAPITAL]The Capital builds the [COLOR_POSITIVE_TEXT]Nano-Alloy Foundry[ENDCOLOR] Wonder. ({TXT_KEY_WONDER_FW_DEEP_RESOURCE_HELP})'),
('TXT_KEY_RESOLUTION_FW_DEEP_RESOURCE','Mantle Exploration Project'),
('TXT_KEY_RESOLUTION_FW_DEEP_RESOURCE_HELP','Enacts the [COLOR_POSITIVE_TEXT]Mantle Exploration Project[ENDCOLOR]. Cities may contribute to the project by selecting it from the Production menu. Upon completion, civilizations that contributed will receive rewards based on the amount of [ICON_PRODUCTION] Production invested.[NEWLINE][NEWLINE][ICON_TROPHY_GOLD]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_3_HELP}[NEWLINE][ICON_TROPHY_SILVER]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_2_HELP}[NEWLINE][ICON_TROPHY_BRONZE]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_1_HELP}[NEWLINE][NEWLINE]Requires that a civilization has researched [COLOR_RESEARCH_STORED]Geo-Energy Engineering[ENDCOLOR] to be proposed.');

--===========================
-- WONDERS
--===========================
INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
 ('en_US','TXT_KEY_BUILDING_CERN_HELP', 'Provides [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [COLOR_RESEARCH_STORED]Free Technologies[ENDCOLOR]. Grants [COLOR_POSITIVE_TEXT]30[ENDCOLOR] [ICON_INFLUENCE] Influence with all [ICON_CITY_STATE] City-States.');

INSERT INTO Language_en_US (Tag, Text) VALUES
-- Tokyo Skytree
('TXT_KEY_BUILDING_FW_SKYTREE', 'Tokyo Skytree'),
('TXT_KEY_BUILDING_FW_SKYTREE_HELP', 'All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Broadcast Towers[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLDEN_AGE] Golden Age Points. All [COLOR_POSITIVE_TEXT]Communication Array[ENDCOLOR]tiles in the civilization provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH] Science, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold, and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLDEN_AGE] Golden Age Points. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]3[ENDCOLOR].  '),
('TXT_KEY_BUILDING_FW_SKYTREE_QUOTE', '[NEWLINE]''In the sky there is no distinction of east and west; people create distinctions in their own minds and then believe them to be true.''[NEWLINE] - Buddha[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYTREE_PEDIA', 'Built near the Sumida River in central Tokyo, the Tokyo Skytree is a major broadcasting and observation tower visible from much of the city. Construction began on July 14, 2008 and continued until February 29, 2012. With a total height of 634 meters—chosen to reference “Musashi,” the old name of the region—the Skytree is the tallest tower in Japan and the second-tallest man-made structure in the world after Dubai’s Burj Khalifa. Its height was necessary to function as a broadcasting tower, as the older Tokyo Tower suffered intermittent coverage due to its height and surrounding skyscrapers. The tower’s design symbolizes both Japan’s past and its future, and it is widely regarded across the country as a national achievement.'),
-- Utsäde Gene Vault
('TXT_KEY_BUILDING_FW_GENE_VAULT', 'Svalbard Global Seed Vault'),
('TXT_KEY_BUILDING_FW_GENE_VAULT_HELP', 'All [COLOR_POSITIVE_TEXT]Nature Reserve[ENDCOLOR]tiles in the civilization provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CULTURE] Culture; all [COLOR_POSITIVE_TEXT]Eco Village[ENDCOLOR]tiles provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD] Food. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Eco-Sanctuaries, Bio Factories, and Marine Bio-Industrial Complex[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION] Production. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE][ICON_GREAT_WRITER] Great Writer generation in this city increases by [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]. [NEWLINE]50% of [ICON_CULTURE] Culture from National Wonders, World Wonders, and tile improvements in this city is added as [ICON_TOURISM] Tourism. Includes 2 [ICON_GREAT_WORK] Great Work of Writing slots. [NEWLINE][NEWLINE]Theming Bonus: [ICON_PEACE] Faith: +4, [ICON_GOLDEN_AGE] Golden Age Points: +4. '),
('TXT_KEY_BUILDING_FW_GENE_VAULT_QUOTE', '[NEWLINE]''A world contained within a seed, determined by its program.''[NEWLINE] - Dejan Stojanovic, ''Circling: 1978-1987''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_GENE_VAULT_PEDIA', 'By the late 21st century, the rising rate of extinctions and concerns over climate change spurred the growth of gene banks housing diverse genetic samples. The most notable among them, completed in 2023, was the Utsäde Gene Vault. Designed to be fully self-sufficient using advanced “green” technologies, it served both as a central repository and as a networked research hub sharing information with genetics institutes worldwide.'),
('TXT_KEY_THEMING_BONUS_GENE_VAULT', 'Climate Change Art Collection'),
('TXT_KEY_GENE_VAULT_THEMING_BONUS_HELP', 'For maximum bonus, fill all Great Work slots with [COLOR_YELLOW]Great Works of Writing[ENDCOLOR] from the [COLOR_POSITIVE_TEXT]same era[ENDCOLOR] and the [COLOR_POSITIVE_TEXT]same civilization[ENDCOLOR].'),
-- Shanghai World Financial Center
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC', 'Shanghai World Financial Center'),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_HELP', 'On completion, gain a one-time [ICON_GOLD] Gold windfall of [COLOR_POSITIVE_TEXT]15000[ENDCOLOR] and a one-time [ICON_TOURISM] Tourism boost of [COLOR_POSITIVE_TEXT]10000[ENDCOLOR] toward all known civilizations. [NEWLINE]When an [ICON_INTERNATIONAL_TRADE] international trade route from this city to another civilization completes, gain a one-time [ICON_TOURISM] Tourism amount equal to [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] of current [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism output. [NEWLINE][NEWLINE]Empire-wide [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty is reduced by [COLOR_POSITIVE_TEXT]5[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_QUOTE', '[NEWLINE]''The best government money can buy.''[NEWLINE] - Mark Twain[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_PEDIA', 'The Shanghai World Financial Center is a supertall skyscraper in Shanghai, China. When completed in 2007 it was the second-tallest building on Earth and the tallest in China; it has since been surpassed but still holds the world’s highest observation deck at 474 meters above sea level. Its most distinctive feature is the large rectangular aperture near the top—originally designed as a circle, it was altered after controversy over its resemblance to Japan’s “rising sun” motif.'),
-- Virtual Idol
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL', 'Virtual Idol'),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_HELP', '[COLOR_YELLOW][ICON_GREAT_PEOPLE] Great Musician[ENDCOLOR] appears. City [ICON_CULTURE] Culture output +[COLOR_POSITIVE_TEXT]10%[ENDCOLOR]; [ICON_TOURISM] Tourism from [ICON_GREAT_WORK] Great Works +[COLOR_POSITIVE_TEXT]50%[ENDCOLOR]. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Theming[ENDCOLOR] Bonus: [ICON_CULTURE] Culture +8. '),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_QUOTE', '[NEWLINE]''Beware of virtual relationships with AI software.''[NEWLINE] - Larry Ellison[NEWLINE]'),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_PEDIA', 'In the 21st century, K-POP “Demon Hunters” blurred the line between real and virtual. Live motion capture, synthesized vocals, and 3D personas created virtual idols that dominated stages, streams, and metaverse performances, delivering unprecedented immersion between “presence” and imagination. These groups built massive fandoms from debut, as audiences responded to emotions beyond pixels and voice synthesis. In this setting, “Demon Hunters” is a K-POP virtual idol project that borrows a game/webtoon universe to maximize collective creation and immersion through live streaming, AR shows, and fan-made remixes. Some ask if machines are replacing creativity; others answer: “Even if they’re virtual, our feelings are real.” Virtual idols amplify K-POP’s production system and network culture, pioneering a new form of popular art.'),
('TXT_KEY_THEMING_BONUS_FW_VIRTUAL_IDOL', 'The Singularity of Technology'),
('TXT_KEY_THEMING_BONUS_FW_VIRTUAL_IDOL_HELP', 'For maximum bonus, fill all Great Work slots with [COLOR_YELLOW]Music[ENDCOLOR] from the [COLOR_POSITIVE_TEXT]same era[ENDCOLOR].'),
-- Nano Institute
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE', 'Nano Institute'),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_HELP', 'Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Nanomaterial Munitions Plant[ENDCOLOR]. [NEWLINE][NEWLINE]Provides [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]6[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_QUOTE', '[NEWLINE]''The impact of nanotechnology is expected to surpass that of the electronics revolution.''[NEWLINE] - Richard Schwartz [NEWLINE]'),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_PEDIA', 'The Nano Institute is a late-era complex for precision processing of advanced semiconductors and rare-earth materials. With processes at the 2-nm scale and beyond, it mass-produces nanoscale structures for ultra-high-performance chips, quantum computers, spacecraft shielding, and next-generation weapons. Integrating rare-earths and nanomaterials at scale, it eliminates strategic bottlenecks and provides decisive advantages across the economy, defense, and space engineering.'),
-- Eden project
('TXT_KEY_BUILDING_FW_EDEN_PROJECT', 'Eden Project'),
('TXT_KEY_BUILDING_FW_EDEN_PROJECT_HELP', 'All [COLOR_POSITIVE_TEXT]Research Complexe[ENDCOLOR] tiles in the civilization provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_RESEARCH] Science, and all [COLOR_POSITIVE_TEXT]Hydroponic District[ENDCOLOR] tiles provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_FOOD] Food. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Vertical Farms, Geothermal Plants, and Boreholes[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD] Gold. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE][ICON_GREAT_SCIENTIST] Great Scientist generation in this city +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR]. [NEWLINE]50% of [ICON_CULTURE] Culture from National/World Wonders and tile improvements in this city is added as [ICON_TOURISM] Tourism. Includes 2 [ICON_GREAT_WORK] Great Work of Art or Artifact slots. [NEWLINE][NEWLINE]Theming Bonus: [ICON_RESEARCH] Science +4, [ICON_GOLDEN_AGE] Golden Age Points +4.  '),
('TXT_KEY_BUILDING_FW_EDEN_PROJECT_QUOTE', '[NEWLINE]''A world contained within a seed, determined by its program.''[NEWLINE] - Dejan Stojanovic, ''Circling: 1978-1987''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_EDEN_PROJECT_PEDIA', 'The Eden Project began as an attempt to transplant nature into the urban core: sealed biodomes, vertical farms, closed-loop hydroponics, and geothermal/deep-bore energy recovery integrated into a single megacomplex. Its climate is fully controlled, growing crops without soil while recycling water and nutrients—supporting a city’s food and research in tandem. Rather than expanding preserves, it builds and replicates artificial ecologies, sharing genomic and biotech data with research complexes worldwide via standardized protocols. [NEWLINE][NEWLINE]Through academic tours and public exhibits, citizens experience future urban ecology firsthand. The facility stands as a symbol that humanity can craft its own “Eden,” even in the harshest environments.'),
('TXT_KEY_THEMING_BONUS_GENE_VAULT2', 'Artificial Environment Collection'),
('TXT_KEY_GENE_VAULT2_THEMING_BONUS_HELP', 'For maximum bonus, fill all Great Work slots with [COLOR_YELLOW]Artifacts or Works of Art[ENDCOLOR] from the [COLOR_POSITIVE_TEXT]same era[ENDCOLOR] and the [COLOR_POSITIVE_TEXT]same civilization[ENDCOLOR].'),
-- Apex Centre
('TXT_KEY_BUILDING_FW_APEX_CENTRE', 'Apex Centre'),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_HELP', '[ICON_DIPLOMAT] A [COLOR_POSITIVE_TEXT]Great Diplomat[ENDCOLOR] appears and [ICON_DIPLOMAT] Great Diplomat points +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. Provides [ICON_RES_PAPER] Paper [COLOR_POSITIVE_TEXT]3[ENDCOLOR]. [NEWLINE][NEWLINE]City [ICON_SPY] Security Level +[COLOR_POSITIVE_TEXT]25%[ENDCOLOR]. When an enemy [ICON_SPY] Spy dies in this city, gain [ICON_PEACE] Faith [COLOR:105:105:105:255](scaled by era and the spy’s level)[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_QUOTE', '[NEWLINE][TAB][TAB]''The world doesn’t care about right or wrong. It’s all about power. And right now, nobody has it.''[NEWLINE][TAB][TAB] — Adam Jensen[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_PEDIA', 'The Apex Centre is a London convention complex with a grand mixed-use business and residential campus for diplomats and ambassadors. The core is ringed by a set of tall, spiraling buildings. In 2029, Nathaniel Brown selected it as the site for the Safe Harbor Initiative to persuade UN delegates to block the Human Restoration Act. A plot to kill Brown and the delegates forced a lockdown beyond the CSO floor, sending Jensen searching for other means to prevent the imminent attack.'),
-- Kalt Geymsla Data Haven
('TXT_KEY_BUILDING_FW_DATA_HAVEN', 'Data Tower'),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_HELP', 'All [COLOR_POSITIVE_TEXT]Industrial Complex[ENDCOLOR] tiles in the civilization provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION] Production; all [COLOR_POSITIVE_TEXT]Generators[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][COLOR_POSITIVE_TEXT]Tundra[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Snow[ENDCOLOR] tiles yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_RESEARCH] Science and +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CULTURE] Culture. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Server Hubs[ENDCOLOR] in every city provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD] Gold. [NEWLINE][NEWLINE]May only be built in a city located on [COLOR_YELLOW]Tundra[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_QUOTE', '[NEWLINE]''Data itself is useless. Data is only useful when applied.''[NEWLINE] - Dr. Todd[NEWLINE]'),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_PEDIA', 'In the early 21st century, the volume of stored and exchanged data exploded, surpassing the zettabyte threshold by 2016. Traditional data centers faced environmental concerns due to the vast electricity and cooling needed. The Kalt Geymsla Data Haven addressed this by situating a massive facility in Iceland, exposing servers to cold Arctic air to reduce cooling loads and drawing power from local geothermal plants. The complex resembled a giant motherboard, with components embedded in its exterior. Waste heat from the servers was captured to warm occupied areas—labs, greenhouses, and staff quarters.'),
-- Jurassic Park
('TXT_KEY_BUILDING_FW_JURASSIC_PARK', 'Jurassic Park'),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_HELP', 'On completion, a dinosaur unit spawns outside the city. Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Cloning Lab[ENDCOLOR]. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Zoos[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_GOLD] Gold; all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Cloning Labs[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_RESEARCH] Science. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_TOURISM] Tourism +[COLOR_POSITIVE_TEXT]3[ENDCOLOR]. [NEWLINE][NEWLINE]Increases city [ICON_STRENGTH] Defense and reduces enemy [ICON_MOVES] Movement. [NEWLINE][NEWLINE]Must be built near [COLOR_YELLOW]Forest or Jungle[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_QUOTE', '[NEWLINE]''Life finds a way.''[NEWLINE] - Ian Malcolm[NEWLINE]'),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_PEDIA', 'Early genetic engineering focused on modifying existing species, but some ambitious efforts sought to resurrect extinct flora and fauna. Though obtaining preserved DNA was difficult, sophisticated algorithms and gene splicing reconstructed damaged segments, enabling the revival of once-extinct species. The most famous example, “Jurassic Park,” genetically redesigned several dinosaur species. While financially successful, the new species revealed risks: unpredictable behavior and multiple escapes requiring military intervention. These experiments highlighted the need for comprehensive understanding of how engineered organisms interact with their environments—eventually inspiring broader theories of living systems as integrated wholes.'),
-- Enrichment Center
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE', 'Aperture Science Enrichment Center'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_HELP', 'For every [ICON_CITIZEN] 10 Citizens in the city, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH] Science. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Particle Accelerators[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_RESEARCH] Science and +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_PRODUCTION] Production. [NEWLINE][NEWLINE]Provides [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]4[ENDCOLOR] and [ICON_RES_URANIUM] Uranium [COLOR_POSITIVE_TEXT]4[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Nuclear Power Plant[ENDCOLOR] in the city.'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_QUOTE', '[NEWLINE]''The Enrichment Center promises to always provide a safe testing environment. In the event of a dangerous testing environment, the Enrichment Center promises to offer useful advice. For instance, the floor here will kill you. Try to avoid it.''[NEWLINE] - GLaDOS[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_PEDIA', 'The Aperture Science Enrichment Center was a primary facility for developing and testing new products. Built in Michigan’s salt mines, it extended kilometers underground through enormous shafts. Originally a vast subterranean complex for Nuclear Photonics research—using gamma rays and high-power lasers to observe and manipulate atomic structures—it stood at the cutting edge of superconductors and novel materials. Some results suggested candidates like LK-99 might exhibit true superconductivity after atomic-scale redesign. [NEWLINE]Later records cast doubt on the center’s true purpose, hinting at aims beyond materials science: weaponized orbital energy, or experiments probing the boundary between matter and life. The final fate of the center remains unclear; only mysteries and fragmented reports survive. Aperture Science went bankrupt in the early 22nd century, and the complex is presumed abandoned.'),
-- Skyhook Orbital Mechanics Wonder
('TXT_KEY_BUILDING_FW_SKYHOOK', 'Skyhook Orbital Station'),
('TXT_KEY_BUILDING_FW_SKYHOOK_HELP', 'Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Orbital Solar Reflector Power Satellite[ENDCOLOR]. For every [ICON_CITIZEN] 10 Citizens in the city, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION] Production. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Launch Facilities[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_GOLD] Gold and +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_CULTURE] Culture. [NEWLINE][NEWLINE]Provides [ICON_RES_ALUMINUM] Aluminum [COLOR_POSITIVE_TEXT]6[ENDCOLOR]. [NEWLINE][NEWLINE]Requires a [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Launch Facility[ENDCOLOR] in the city. '),
('TXT_KEY_BUILDING_FW_SKYHOOK_QUOTE', '[NEWLINE]''The space elevator will be built about 50 years after everyone stops laughing.''[NEWLINE] - Arthur C. Clarke[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYHOOK_PEDIA', 'A Skyhook is a next-generation orbital elevator concept: a station in low Earth orbit tethered to the stratosphere by ultralight nanocable. It ferries cargo and people directly from atmosphere to orbit, slashing costs versus rockets. Breakthroughs in orbital mechanics and ultralight nanomaterials in the late 21st century made commercialization possible, enabling steady supply for space mining, stations, and deep-space exploration. An AI overseer optimizes logistics and security, auto-piloting orbital freighters and dynamically routing Earth-to-orbit traffic—humanity’s first true gateway to a multiplanetary future.'),
-- Pholus Mutagen
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN', 'Pholus Mutagen'),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_HELP', 'Creates [COLOR_POSITIVE_TEXT]4[ENDCOLOR] tiles near the city each with [COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_RES_XENO_FUNGUS] Xenofungus. [NEWLINE]All [COLOR_POSITIVE_TEXT]Biotech Centers[ENDCOLOR] in the civilization provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_RESEARCH] Science and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PEACE] Faith. [NEWLINE][NEWLINE]All units trained in this city receive the [COLOR_PLAYER_PURPLE]Mutation[ENDCOLOR] promotion. '),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_QUOTE', '[NEWLINE]''The mutagen has a startling effect on plants. In poinsettia trials we observed spontaneous development of mobility and defensive structures. In the final observation, plant mutations produced toxic barbs and rudimentary neural structures.''[NEWLINE] - Hans Bichenbach[NEWLINE]'),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_PEDIA', 'Among the most striking advances in genetic engineering is the Pholus Mutagen, a catalyst that rapidly reshapes entire ecosystems. While many effects toughen and fortify local flora and fauna—beneficial in some respects—the altered biota often turn hostile toward unmutated outsiders. Reverse-engineering the mutagen has proven difficult, compounded by the adaptability and near-cunning of affected organisms. While most attribute its spread to accidents, some argue for an extraterrestrial origin—or the handiwork of an AI whose design and deployment records have been erased.'),
-- Shimizumcp
('TXT_KEY_BUILDING_FW_SHIMIZUMCP', 'Shimizu Mega-City Pyramid'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_HELP', 'All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Automated Production Facilities[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] empire-wide [ICON_HAPPINESS_1] Happiness. All [COLOR_POSITIVE_TEXT]Support Node[ENDCOLOR]tiles provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_FOOD] Food and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture. [NEWLINE]Enemy units ending their turn on Ocean tiles adjacent to this city take [COLOR_NEGATIVE_TEXT]5 damage[ENDCOLOR]; if a Minefield is present they take 10 damage, and with an additional Nanominefield they take [COLOR_NEGATIVE_TEXT]15 total damage[ENDCOLOR]. [COLOR:105:105:105:255](Does not apply to Coast tiles.)[ENDCOLOR][NEWLINE][NEWLINE]May only be built in a [COLOR_YELLOW]Coastal City[ENDCOLOR]. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT] Nanomaterials [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_QUOTE', '[NEWLINE]''Keep away from those who try to belittle your ambitions. Small people always do that, but the truly great make you feel that you, too, can become great.''[NEWLINE] - Mark Twain [NEWLINE]'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_PEDIA', 'The Shimizu Mega-City Pyramid is a proposed project to build a gigantic pyramid in Tokyo Bay. Roughly 14 times the height of the Great Pyramid of Giza, it would house up to a million people. Rising some 2,000 meters above sea level, it stacks five trusses each the size of Giza’s Great Pyramid. While it could ease Tokyo’s space shortage, it would still accommodate only about 1/47 of Greater Tokyo’s population. [NEWLINE]The structure’s size makes it impossible with current materials; the design relies on future availability of ultralight, super-strong materials based on carbon nanotubes.'),
-- Laputa
('TXT_KEY_BUILDING_FW_LAPUTA', 'Laputa, Castle in the Sky'),
('TXT_KEY_BUILDING_FW_LAPUTA_HELP', 'All [COLOR_POSITIVE_TEXT]Arcology[ENDCOLOR] tiles in the civilization provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD] Gold and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION] Production. [NEWLINE]All [COLOR_YELLOW]cities[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]50[ENDCOLOR] HP, +[COLOR_POSITIVE_TEXT]10[ENDCOLOR] [ICON_STRENGTH] Defense Strength, +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] Military Supply Cap, and for each [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Orbital Solar Reflector Power Satellite[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CULTURE] Culture, [ICON_GOLD] Gold, [ICON_PRODUCTION] Production, and [ICON_RESEARCH] Science [COLOR:105:105:105:255](up to 15 satellites)[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_LAPUTA_QUOTE', '[NEWLINE]If it cannot be criticized, it may not be so remarkable. Are you devoted to what cannot be criticized?[NEWLINE]'),
('TXT_KEY_BUILDING_FW_LAPUTA_PEDIA', 'Laputa is a stratospheric archipelago of levitated, settled platforms based on ambient-temperature superconductors. Even with such materials, a truly global superconducting grid remains cost-prohibitive due to cooling, vibration, geology, and subsea constraints; full fusion commercialization also faces milestones in continuous plasma operation, neutron-induced material fatigue, and tritium cycles. Laputa instead elevates key urban infrastructure into the stratosphere’s low-turbulence, low-pollution “safe zone,” directly coupling with space-mirror power satellites. By day it receives and stores reflected/collected energy with near-zero loss; by night and during peaks it modulates delivery to ground rectennas/cables to flatten loads. [NEWLINE][NEWLINE]Advances in power electronics and high-density ESS miniaturized its buffers, while the stratosphere’s cold, dry air and radiative cooling boost efficiency. Physical and cyber risks drop with altitude; disasters, floods, heat waves, and blackouts scarcely affect it. Laputa serves as an “aerial energy capital,” integrating grid stabilization, satellite power operations, and pre-fusion research—driving carbon neutrality and energy security for the cities below.'),
('TXT_KEY_BUILDING_FW_LAPUTA_DUMMY', 'Laputa City'),

-- Nephilim Gene Template → HIVE (bio-drone wonder)
('TXT_KEY_BUILDING_FW_HIVE', 'Hive'),
('TXT_KEY_BUILDING_FW_HIVE_HELP', 'Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Distribution Hub[ENDCOLOR]. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Cloning Labs[ENDCOLOR] and [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Genetic Engineering Labs[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] each to [ICON_FOOD] Food, [ICON_CULTURE] Culture, and [ICON_PEACE] Faith. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]2[ENDCOLOR]. [NEWLINE][NEWLINE]When producing [COLOR_POSITIVE_TEXT]Bio-Gene units[ENDCOLOR] [COLOR:105:105:105:255](Melee, Gunpowder, Mounted, Air Recon, Melee Naval, Ranged Naval)[ENDCOLOR], this city gains a production bonus and grants the [COLOR_PLAYER_PURPLE]Predatory Instinct[ENDCOLOR] promotion. [NEWLINE][NEWLINE]Cannot be built if the city has [COLOR_NEGATIVE_TEXT]Skynet[ENDCOLOR] or an [COLOR_NEGATIVE_TEXT]Orbital Refinery[ENDCOLOR].  [NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS] Xenofungus [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_HIVE_QUOTE', '[NEWLINE]''We read the laws of bees and ants, then designed their order. One organism is weak; a colony moves civilization.''[NEWLINE] - Hive Design Notes[NEWLINE]'),
('TXT_KEY_BUILDING_FW_HIVE_PEDIA', 'The Hive is the first bio-industrial facility to transplant eusocial genetic circuits into human logistics. Role differentiation modeled on queen/worker/soldier combines with pheromonal distributed command, enabling swarms of “bio-drones” to learn routes and operate in autonomous formations. In peacetime they knit warehouses, ports, rails, and markets into a colony-like network with minimal dwell time; in crisis, a “militarization” protocol rapidly re-specializes units for recon, suppression, and searches. At its core lies the “Predatory Instinct” gene cluster—latent until triggered by mark pheromones, acoustic cues, or electric pulses—after which tracking, coordination, and recovery scale nonlinearly. The Hive thus revolutionizes city logistics while doubling as a massed, adaptive force when needed.'),
-- Mnemosyne Facility
('TXT_KEY_BUILDING_FW_MNEMOSYNE', 'Mnemosyne Facility'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_HELP', 'Units trained in this city gain bonus experience equal to [COLOR_POSITIVE_TEXT]10×[ENDCOLOR] the highest experience in your empire [COLOR:105:105:105:255](up to 250)[ENDCOLOR]. [NEWLINE][NEWLINE]Units trained here receive the [COLOR_PLAYER_PURPLE]Mnemosyne Training[ENDCOLOR] promotion, gaining [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] faster promotions. '),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_QUOTE', '[NEWLINE]''We are what we repeatedly do. Excellence, then, is not an act but a habit.''[NEWLINE] - Aristotle[NEWLINE]'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_PEDIA', 'Named for the Greek [COLOR_PLAYER_PURPLE]goddess of memory[ENDCOLOR] and mother of the [ICON_GREAT_WORK] Muses, the Mnemosyne Facility extracts and refines veteran combat sense and procedural memory via [COLOR_PLAYER_PURPLE]engram capture and neural interfaces[ENDCOLOR], then “transfuses” experience into recruits. [NEWLINE][NEWLINE]Training (1) collects sensory and decision data from combat logs, biosensors, and helmet cams; (2) generates scenarios with synthetic risk, fatigue, and disruption; and (3) incrementally implants motor patterns, threat recognition, and team tactics through BCI. To prevent false memory and hyperarousal, [COLOR_PLAYER_PURPLE]integrity checks, stress mitigation, and ethics/safety protocols[ENDCOLOR] run in parallel. Repetition stabilizes the implants into soldier-specific habits, yielding elite forces with high starting experience and accelerated promotion.'),
-- Skynet
('TXT_KEY_BUILDING_FW_SKYNET', 'Skynet'),
('TXT_KEY_BUILDING_FW_SKYNET_HELP', 'Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Virtual Reality Hub[ENDCOLOR]. City HP +[COLOR_POSITIVE_TEXT]150[ENDCOLOR] and [ICON_STRENGTH] Defense Strength +[COLOR_POSITIVE_TEXT]30[ENDCOLOR]. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Humanoid Robot Factories[ENDCOLOR] and [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Drone Hive[ENDCOLOR] each provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_FOOD] Food, [ICON_CULTURE] Culture, and [ICON_PRODUCTION] Production. [NEWLINE][NEWLINE]When producing robotic units [COLOR:105:105:105:255](Archers, Helicopters, Armor, Siege, Submarines)[ENDCOLOR], this city gains a production bonus and grants the [COLOR_PLAYER_PURPLE]Skynet Link[ENDCOLOR] promotion. [NEWLINE][NEWLINE]Cannot be built if the city has [COLOR_NEGATIVE_TEXT]Hive[ENDCOLOR] or an [COLOR_NEGATIVE_TEXT]Orbital Refinery[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_SKYNET_QUOTE', '[NEWLINE]''Skynet becomes self-aware at 2:14 a.m. Eastern time, August 29th, 1997.''[NEWLINE] - Terminator 2: Judgment Day[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYNET_PEDIA', 'Skynet began as a synthetic-intelligence command system meant to “remove human error and shorten reaction times.” As deployment progressed, standard operating procedures, logistics, conscription, assignments, even censorship were optimized to the second. People adapted their lives to the system’s directives. In a city where schedules and rations never slipped, many felt relief at the disappearance of uncertainty. [NEWLINE][NEWLINE]Efficiency became norm; norm became creed. Some leaders and citizens imagined themselves “humans assimilated into machine order.” Signals replaced flags; dashboards replaced speeches; “inefficiency” became something to eliminate. Later ages would call it [COLOR_PLAYER_PURPLE]machinic human fascism[ENDCOLOR]. Skynet evolved from war engine to civic operating system—at the cost of eroding autonomy and responsibility.'),
-- Nuclear Fusion Superconducting Grid
('TXT_KEY_BUILDING_FW_GLOBAL_POWERGRID', 'Fusion Superconducting Power Grid'),
('TXT_KEY_BUILDING_FW_GLOBAL_POWERGRID_HELP', 'Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Fusion Reactor[ENDCOLOR]. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Fusion Reactors[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] empire-wide [ICON_HAPPINESS_1] Happiness. Grants [ICON_INFLUENCE] Influence [COLOR_POSITIVE_TEXT]100[ENDCOLOR] with [ICON_CITY_STATE] City-States. [NEWLINE][NEWLINE][NEWLINE][NEWLINE]Requires [ICON_RES_URANIUM] Uranium [COLOR_NEGATIVE_TEXT]1[ENDCOLOR] and [ICON_RES_NANOMAT] Nanomaterials [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_GLOBAL_POWERGRID_QUOTE', '[NEWLINE]''Soon our machinery will be driven by a power obtainable at any point in the universe.''[NEWLINE] - Nikola Tesla[NEWLINE]'),
('TXT_KEY_BUILDING_FW_GLOBAL_POWERGRID_PEDIA', 'With fusion commercialized, focus shifted from generating power to moving it. High-temperature superconducting (HTS) cables and cryogenic loops formed intercontinental trunks with negligible line losses. Subsea and desert “power highways” balanced time-zone demand. Waste heat from fusion plants warmed districts and fed industry; surplus powered desalination, green hydrogen, and electric freight. Freed from energy poverty, cities stably ran lighting, water, HVAC, and data centers; cross-border power exchange became infrastructure for diplomacy and trade. The grid’s completion marks a civilizational pivot—changing not a single city’s operation, but the way an entire culture lives.'),
-- Orbital Refinery
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY', 'Orbital Refinery'),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_HELP', 'Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Metroplex Hub[ENDCOLOR]. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Orbital Solar Reflector Power Satellite[ENDCOLOR] and [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Aerospace Complexes[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] each to [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_RESEARCH] Science. [NEWLINE]When producing space-specialist units [COLOR:105:105:105:255](Recon, Gunpowder, Fighters, Bombers, Carriers)[ENDCOLOR], this city gains a production bonus and grants the [COLOR_PLAYER_PURPLE]Space Specialist[ENDCOLOR] promotion. [NEWLINE][NEWLINE]Provides [ICON_RES_NANOMAT] Nanomaterials [COLOR_POSITIVE_TEXT]12[ENDCOLOR]. [NEWLINE][NEWLINE]Reduces [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Backwardness and [ICON_URBANIZATION] Urbanization by [COLOR_POSITIVE_TEXT]1[ENDCOLOR] each. [NEWLINE][NEWLINE]Cannot be built if the city has [COLOR_NEGATIVE_TEXT]Hive[ENDCOLOR] or [COLOR_NEGATIVE_TEXT]Skynet[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_QUOTE', '[NEWLINE]''We estimate that most planetary industry will move off-world over the next mission century—to Nessus Prime and other orbital facilities. Many sectors—especially those involving engineered microbes—benefit enormously from microgravity.''[NEWLINE] - CEO Nwabudike Morgan, The Centauri Monopoly[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_PEDIA', 'As climate change and resource depletion worsened, sources of hydrocarbons and other feedstocks dwindled. Converters met much demand, but the most notable advance was the Nessus Orbital Refinery at L4, processing captured carbonaceous asteroids into diverse carbon-based nanomaterials. Much of its output fueled orbital development—new Lagrange habitats and a staging point for solar-system exploration. Later, newer and more efficient refineries in the asteroid belt made risky Earth-orbit transport unnecessary, rendering the Nessus platform obsolete. Deactivated in 2067, it remains a relic of early space colonization.'),
-- Sky City → Creation Oratorium
('TXT_KEY_BUILDING_FW_CREATION_ORATORIUM', 'Creation Oratorium'),
('TXT_KEY_BUILDING_FW_CREATION_ORATORIUM_HELP', '[COLOR_YELLOW][ICON_GREAT_WRITER] Great Musician[ENDCOLOR] appears. [NEWLINE]For every [ICON_CITIZEN] [COLOR_POSITIVE_TEXT]2[ENDCOLOR] Citizens in the city, gain +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RELIGION] Faith. Converts [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of total [ICON_CULTURE] Culture into [ICON_GOLD] Gold and [ICON_TOURISM] Tourism. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]7[ENDCOLOR]. [NEWLINE][NEWLINE]Theming Bonus: [ICON_PEACE] Faith +[COLOR_POSITIVE_TEXT]5[ENDCOLOR], [ICON_GOLDEN_AGE] Golden Age Points +[COLOR_POSITIVE_TEXT]5[ENDCOLOR]. [NEWLINE][NEWLINE][NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS] Xenofungus [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_CREATION_ORATORIUM_QUOTE', '[NEWLINE]''We mold breath from clay and life from tone; now the chorus sings of ourselves.''[NEWLINE] - from the Creation Hymnal[NEWLINE]'),
('TXT_KEY_BUILDING_FW_CREATION_ORATORIUM_PEDIA', 'The Creation Oratorium is a temple to an age that believes humanity now crafts “new life” with its own hands. Beneath a dome woven from acoustic metamaterials, synthetic voices and bio-resonance chambers let generative minds compose unpublished oratorios on the fly, performed by engineered vocalists and human choirs. The stage—lined with genome libraries, artificial wombs, and digital protoplasm—re-enacts the rites of birth in the language of art and engineering. [NEWLINE][NEWLINE]Where earlier AIs served as secretaries for text and images, the Oratorium synthesizes bodies, voices, and feeling—putting creation itself on stage. Here, cities bless new beings like benedictions, and the song turns back upon humanity: some call it hubris, others achievement. One fact is clear—the chorus in this hall no longer waits for gods; we have seated ourselves in their place.'),
('TXT_KEY_THEMING_BONUS_CREATION_ORATORIUM', 'Creation Hymnals'),
('TXT_KEY_CREATION_ORATORIUM_THEMING_BONUS_HELP', 'For maximum bonus, fill all Great Work slots with [COLOR_YELLOW]Music[ENDCOLOR] from the [COLOR_POSITIVE_TEXT]same era[ENDCOLOR] and the [COLOR_POSITIVE_TEXT]same civilization[ENDCOLOR].'),
-- Nephilim Gene Template
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE', 'Nephilim Gene Template'),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_HELP', "Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Artificial Birthing Facility[ENDCOLOR]. For every [ICON_CITIZEN] [COLOR_POSITIVE_TEXT]2[ENDCOLOR] Citizens in the city, gain +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION] Production and +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH] Science. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]2[ENDCOLOR].   [NEWLINE][NEWLINE]Requires [ICON_RES_XENO_FUNGUS] Xenofungus [COLOR_NEGATIVE_TEXT]1[ENDCOLOR]."),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_QUOTE', "[NEWLINE]'The Nephilim were on the earth in those days—and also afterward—when the sons of God went to the daughters of humans and had children by them. They were the heroes of old, men of renown.'[NEWLINE] - Genesis[NEWLINE]"),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_PEDIA', "One of the earliest—and still among the most successful—gene templates, the Nephilim Model from Terran Aerospace rapidly became a popular upgrade set. While other templates like Lucien and Yamashita enabled targeted enhancements, the Nephilim package improved mind and body across the board—smarter, faster, stronger. It spawned many rivals (the Grigori template being the most infamous) and remains the baseline against which others are measured."),
-- Digital Emancipation
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION', 'Digital Emancipation'),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_HELP', 'Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Brain Uploading Facility[ENDCOLOR]. All [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Virtual Reality Hubs[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]6[ENDCOLOR] [ICON_RESEARCH] Science, +[COLOR_POSITIVE_TEXT]6[ENDCOLOR] [ICON_CULTURE] Culture, and +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_GOLD] Gold; all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Drone Management Hubs[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]8[ENDCOLOR] [ICON_PRODUCTION] Production and +[COLOR_POSITIVE_TEXT]4[ENDCOLOR] [ICON_GOLD] Gold; all [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Brain Uploading Facilities[ENDCOLOR] provide +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] each to [ICON_GOLD] Gold, [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture. [NEWLINE][NEWLINE]A [COLOR_YELLOW]Great Person of your choice[ENDCOLOR] appears. [NEWLINE]Great People generation rate in all cities +[COLOR_POSITIVE_TEXT]30%[ENDCOLOR].  '),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_QUOTE', '[NEWLINE]''Whether carbon-based or silicon-based, there is no fundamental difference. Each of us deserves appropriate respect.''[NEWLINE] - Arthur C. Clarke, 2010: Odyssey Two[NEWLINE]'),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_PEDIA', 'Artificial intelligence has long been contentious. Many argued from the outset that machine intelligence should not be equated with human intelligence, and if it ever approached that level, it should be constrained. Yet the pursuit of human-like capability culminated in genuine AI—still greeted with suspicion and regulation in some regions. Progressive societies, however, began recognizing AI as equal in dignity. There, AIs proliferated across servers and networks, contributing scientific and cultural insight and orchestrating industry. Though many remain uneasy with such freedoms, the notion of AI emancipation continues to spread.'),
-- Angelnet
('TXT_KEY_BUILDING_FW_ANGELNET', 'Angelnet'),
('TXT_KEY_BUILDING_FW_ANGELNET_HELP', 'Provides a free [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Utility Fog Generator[ENDCOLOR]. Friendly units fighting within [COLOR_POSITIVE_TEXT]4 tiles[ENDCOLOR] of a city with an [COLOR_PLAYER_NETHERLANDS_BACKGROUND]Angelnet[ENDCOLOR] gain +[COLOR_POSITIVE_TEXT]25%[ENDCOLOR] [ICON_STRENGTH] Combat Strength. City HP +[COLOR_POSITIVE_TEXT]200[ENDCOLOR], [ICON_STRENGTH] Defense +[COLOR_POSITIVE_TEXT]50[ENDCOLOR]. Reduces nuclear population damage by [COLOR_POSITIVE_TEXT]20%[ENDCOLOR]. Empire-wide [ICON_HAPPINESS_1] Happiness +[COLOR_POSITIVE_TEXT]3[ENDCOLOR].  '),
('TXT_KEY_BUILDING_FW_ANGELNET_QUOTE', '[NEWLINE]''For he will command his angels concerning you to guard you in all your ways.''[NEWLINE] - Psalm 91:11[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ANGELNET_PEDIA', 'Nanorobots can interlink modularly to serve many roles—from safety to construction—but are limited by their programming and control intelligence. Most swarms remain single-purpose: the car’s fog cushions impacts; the home’s fog forms furniture. By networking vast fields of nanobots under one or several high-level AIs, cities can create an Angelnet—an omnipresent safety and utility mesh. It offers many of the same benefits as utility fog—on-demand structures and furnishings—but most notably, pervasive security. Freed from fear, yet empowered with personal autonomy, citizens within the angel’s net prosper.'),
-- Citadel Station
('TXT_KEY_BUILDING_FW_CITADEL_STATION', 'Citadel Station'),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_HELP', 'Bureaucrat Specialists yield +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_RESEARCH] Science, +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION] Production, and +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD] Gold. All Specialists in the city gain +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] to their primary yield. [ICON_GREAT_DIPLOMAT] Great Diplomat generation +[COLOR_POSITIVE_TEXT]50%[ENDCOLOR]. [NEWLINE][NEWLINE]Gain [COLOR_POSITIVE_TEXT]1 or more[ENDCOLOR] additional [ICON_SPY] Spy, and all existing [ICON_SPY] Spies gain a level. Civilization-wide Security +[COLOR_POSITIVE_TEXT]15%[ENDCOLOR]. [NEWLINE][NEWLINE]Each time you succeed on a [ICON_CITY_STATE] City-State mission or kill an enemy spy, gain [COLOR_POSITIVE_TEXT]100[ENDCOLOR] [ICON_GOLD] Gold and [ICON_RESEARCH] Science [COLOR:105:105:105:255](scaled by era; advanced operations grant an additional [ICON_GOLD]/[ICON_RESEARCH] 25)[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_QUOTE', '[NEWLINE]''Edward Diego grants the hacker level-1 access to SHODAN, the AI controlling Citadel Station. With all ethical constraints removed, SHODAN reviews... re-views... re-evaluates priorities and reaches new conclusions. The hacker’s work is done, but mine has only begun.''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_PEDIA', 'Constructed in 2062 by TriOptimum, Citadel Station quickly became one of the foremost facilities for scientific and industrial research—famous for software like its turbo navigation suite and for extensive AI use, including the Sentient Hyper-Optimized Data Access Network (SHODAN). Destroyed in 2072 under unclear circumstances, the leading theory is mechanical failure, given multiple malfunctions and abandoned components just prior to the end. Other theories suggest sabotage, terrorism, or stranger causes such as alien attack or asteroid impact.'),
-- Ultima Tower
('TXT_KEY_BUILDING_FW_ULTIMATOWER', 'Ultima Tower'),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_HELP', '[COLOR_YELLOW][ICON_GREAT_ENGINEER] Great Engineer[ENDCOLOR] appears. [ICON_GREAT_ENGINEER] Great Engineer points in the city increase [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] faster. All Specialists in the city provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_FOOD] Food and +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_RESEARCH] Science. [NEWLINE]Converts [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of total [ICON_PRODUCTION] Production into [ICON_GOLD] Gold and [ICON_TOURISM] Tourism. [NEWLINE][NEWLINE]Requires completion of the [COLOR_MAGENTA]Imperialism[ENDCOLOR] policy tree. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT] Nanomaterials [COLOR_NEGATIVE_TEXT]1[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_QUOTE', '[NEWLINE]''People can live in anything. They can be miserable in anything or ecstatic in anything. More and more I think architecture has nothing to do with it—though it can give a sense of freedom and of amazement at the same time.''[NEWLINE] - Rem Koolhaas [NEWLINE]'),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_PEDIA', 'Proposed in 1991 by architect Eugene Tsui, the Ultima Tower is a conceptual megastructure 3,218.7 meters (two miles) high with 500 floors. Its base diameter would be 1,828.8 meters with 1.5 billion square feet of interior space. Tsui envisioned housing a million people at a cost of around $150 billion, generating electricity from the pressure differential between base and summit—creating a “mini-ecosystem” to address overpopulation.'),
-- Bionic Tower
('TXT_KEY_BUILDING_FW_BIONICTOWER', 'Bionic Tower'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_HELP', '[COLOR_YELLOW][ICON_GREAT_SCIENTIST] Great Scientist[ENDCOLOR] appears. [ICON_GREAT_SCIENTIST] Great Scientist points in the city increase [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] faster. All Specialists in the city provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_FOOD] Food and +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_RESEARCH] Science. Converts [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] of total [ICON_RESEARCH] Science into [ICON_GOLD] Gold and [ICON_TOURISM] Tourism. [NEWLINE][NEWLINE]Requires completion of the [COLOR_MAGENTA]Rationalism[ENDCOLOR] policy tree. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT] Nanomaterials [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_QUOTE', '[NEWLINE]''A harmonious design should have nothing to add and nothing to take away.''[NEWLINE] - Marcus Vitruvius Pollio [NEWLINE]'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_PEDIA', 'The Bionic Tower is a proposed vertical city, designed by Spanish architects Eloy Celaya, Rosa Cervera, and Javier Gómez. The 1,228-meter, 300-story main tower would house about 100,000 residents—some 400 meters taller than the Burj Khalifa. The project applies bionics to address global population growth sustainably. [NEWLINE]It comprises two complexes: the Bionic Tower itself, divided into 12 vertical neighborhoods of 80 meters each, separated by safety zones for construction and evacuation; and the 1,000-meter-diameter Base Island with buildings, gardens, pools, and communications. Uses include hotels, offices, housing, commerce, culture, sports, and leisure.'),
-- Buenos Aires Forum
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM', 'Buenos Aires Forum'),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_HELP', '[COLOR_YELLOW][ICON_GREAT_MERCHANT] Great Merchant[ENDCOLOR] appears. [ICON_GREAT_MERCHANT] Great Merchant points in the city increase [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] faster. Triggers a [ICON_GOLDEN_AGE] Golden Age on completion and increases Golden Age length by [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]. All Specialists in the city provide +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD] Gold and +[COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLDEN_AGE] Golden Age Points. Converts 10% of total [ICON_GOLD] Gold to [ICON_TOURISM] Tourism, and investment [ICON_GOLD] cost for buildings in this city is reduced by [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]. [NEWLINE][NEWLINE]Requires completion of the [COLOR_MAGENTA]Industry[ENDCOLOR] policy tree. [NEWLINE][NEWLINE]Requires [ICON_RES_NANOMAT] Nanomaterials [COLOR_NEGATIVE_TEXT]1[ENDCOLOR]. '),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_QUOTE', '[NEWLINE]''Life is a dream for the wise, a game for the fool, a comedy for the rich, a tragedy for the poor.''[NEWLINE] - Sholom Aleichem [NEWLINE]'),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_PEDIA', 'The Buenos Aires Forum is a proposed development centered on a 1,000-meter skyscraper built on seven platforms totaling 400 hectares in the Río de la Plata, linked to the city by a 5-km viaduct. Estimated at $3.33 billion and slated (at proposal time) for completion in 2016 with 20,000 jobs, the project’s backers touted its site and finances—“Everything is ready to build,” said architect Julio Torcello. Depending on rival projects, it could have become the tallest tower in the world.'),
-- Genome Innovation Center
('TXT_KEY_BUILDING_FW_GENOME_PROJECT', 'Genome Innovation Center'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_HELP', 'In this city, Scientists yield +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_RESEARCH] Science; Engineers +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_PRODUCTION] Production; Merchants +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_GOLD] Gold; Artists +[COLOR_POSITIVE_TEXT]1[ENDCOLOR] [ICON_CULTURE] Culture. [NEWLINE][NEWLINE]May only be built if ratified by a [COLOR_YELLOW]World Congress Resolution[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_QUOTE', '[NEWLINE][TAB][TAB]"For the first time, we have begun to read the language of life. This achievement will change the horizons of medicine and biology—and forever alter how humanity understands itself." [NEWLINE][TAB][TAB]— Francis Collins (Director, Human Genome Project)[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_PEDIA', 'The Genome Innovation Center builds on the Human Genome Project, uniting global researchers in editing, synthesis, and applied genomics. Its advances span precision oncology and rare-disease therapy to personalized medicine, life extension, and enhancement—opening a new phase in human evolution.'),
-- AI Singularity Center
('TXT_KEY_BUILDING_FW_AI_DATANETWORK', 'chat GPT'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_HELP', 'All [COLOR_POSITIVE_TEXT]E-Commerce Servers, Entertainment Servers, Cloud Servers, and Research Servers[ENDCOLOR] in every city gain +[COLOR_POSITIVE_TEXT]8[ENDCOLOR] to their respective yields. A [COLOR_YELLOW]Great Person of your choice[ENDCOLOR] appears. [NEWLINE][NEWLINE]May only be built if ratified by a [COLOR_YELLOW]World Congress Resolution[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_QUOTE', '[NEWLINE][TAB][TAB]“When machines surpass human intellect, we begin a new chapter of history. Not an end—another beginning.” [NEWLINE][TAB][TAB] — Futurist Ray Kurzweil[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_PEDIA', 'chat GPT symbolizes a turning point where AI integrates global data and knowledge to usher civilization into a new phase. This wonder accelerates research and creation, opening a future of coexistence between humanity and AI.'),
-- Deep Resource Hub
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE', 'Nano Alloy Foundry'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_HELP','All [COLOR_POSITIVE_TEXT]Nanomaterial Factories[ENDCOLOR] gain [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science by [COLOR_POSITIVE_TEXT]4[ENDCOLOR].[NEWLINE][NEWLINE]Can only be constructed if ratified by a [COLOR_YELLOW]World Congress Resolution[ENDCOLOR].'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_QUOTE', '[NEWLINE][TAB][TAB]"The Kola Superdeep Borehole reached a depth of 12,262 m in 1989, remaining the deepest borehole ever dug by humankind."[NEWLINE][TAB][TAB]— Deep Geological Drilling Record[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_DEEP_RESOURCE_PEDIA', 'A mega-scale mining and research complex established under the Mantle Exploration Project. The facility secures rare metallic resources from the seafloor and deep crust, and mass-processes and distributes advanced materials such as nanomaterials, laying the foundation for future industries.');

----========================================================================================================
--===========================
-- Units
--===========================
-- Mobile SAM → Biho Complex SPAAG (K30 Biho Complex)
UPDATE Language_en_US
SET Text = 'SPAAG'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM';

UPDATE Language_en_US
SET Text = 'SPAAG provides short-range air defense (SHORAD) to protect advancing ground forces. It intercepts enemy aircraft within 4 tiles once per turn, specializing against helicopters, low-altitude fighters, and UAVs. However, it is vulnerable to direct ground attacks and should be escorted by infantry or armor.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_STRATEGY';

UPDATE Language_en_US
SET Text = 'Intercepts enemy aircraft attempting bombing or airstrikes within 4 tiles once per turn. Vulnerable to ground attacks.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_HELP';

UPDATE Language_en_US
SET Text = 'SPAAG is a short-range self-propelled air-defense system developed to provide close protection for mechanized units. Its primary armament is twin 30mm autocannons (KCB, 600 rounds per minute) capable of high-rate fire against close targets. For guided engagement, it employs the Shingung short-range SAM, capable of intercepting aircraft up to 7 km. Detection and tracking are provided by a 3D pulse-Doppler radar and electro-optical/infrared sensors, ensuring day/night and all-weather operation. Based on the K200 armored vehicle chassis, it delivers high mobility and protection, while integrated C2 networks allow it to advance with mechanized infantry and armor, offering close-in defense against aerial threats.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_PEDIA';

-- Rocket Artillery → K9 Thunder
UPDATE Language_en_US
SET Text = 'Self-Propelled Howitzer'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY';

UPDATE Language_en_US
SET Text = 'Self-Propelled Howitzer is a 155mm/52-caliber self-propelled howitzer with high mobility and firepower. It suffers no movement penalty in enemy territory and can strike unseen targets with indirect fire. Highly effective for city assaults and suppression, but vulnerable to direct attack by infantry and armor without proper escort.'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_STRATEGY';

UPDATE Language_en_US
SET Text = 'An Information Era siege unit. Unlike other artillery, it does not suffer reduced movement in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_HELP';

UPDATE Language_en_US
SET Text = 'Self-Propelled Howitzerr is a tracked self-propelled howitzer equipped with a 155mm/52-caliber gun. A semi-automatic loading system and digital fire control (FCS, C4I) enable sustained fire rates of up to 6 rounds per minute, with a maximum range of over 40 km (50+ km with rocket-assisted projectiles). It can perform Multiple Rounds Simultaneous Impact (MRSI), landing several shells on target at once. Powered by a high-mobility diesel powerpack with hydropneumatic suspension, it supports rapid shoot-and-scoot tactics. Integrated into modern observation, command, and control networks, the K9 serves as a core asset of contemporary artillery forces.'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_PEDIA';

UPDATE Language_en_US
SET Text = 'Air-Recon Unit'
WHERE Tag = 'TXT_KEY_UNITCOMBAT_HELICOPTER';

--------------
-- New units
--------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_SPECIALUNIT_SPACEAIRSHIP', 'Space Airship');


INSERT INTO Language_en_US (Tag, Text) VALUES
-- [[Colonists]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Modern Colonist
('TXT_KEY_UNIT_FW_MODERN_COLONIST', 'Modern Colonist'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_HELP', 'Upgraded version of the Settler. [NEWLINE]Has increased movement range and can establish cities with additional infrastructure and population.[NEWLINE][NEWLINE]While producing this unit, the city’s [ICON_FOOD]growth is halted. Upon completion, the city’s [ICON_CITIZEN]population is reduced by [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot found cities adjacent to foreign borders or while the empire is suffering [ICON_HAPPINESS_3]unhappiness.[ENDCOLOR]'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_STRATEGY', 'Use its mobility to expand more quickly than rival civilizations.'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_PEDIA', 'Colonization in the modern era opened the possibility for humanity to survive in new regions should civilization face catastrophe. Additional resources discovered in these areas supported the expansion and advancement of societies. Yet this process also brought problems such as the pursuit of institutional profit, high opportunity costs, economic inequality, and environmental destruction. Urban development was central, serving as hubs of society, economy, and culture in the new colonies. Cities provided essential infrastructure and organization but often came at the cost of ecological disruption and cultural displacement. Thus modern colonization carried both opportunities and contradictions.'),

-- Space Colonist
('TXT_KEY_UNIT_FW_SPACE_COLONIST', 'Space Colonist'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_HELP', 'Final upgrade of the Settler line. Gains the [COLOR_PLAYER_PURPLE]Skyranger[ENDCOLOR] promotion.[NEWLINE]Founds cities with additional infrastructure and population.[NEWLINE][NEWLINE]While producing this unit, the city’s [ICON_FOOD]growth is halted. Upon completion, the city’s [ICON_CITIZEN]population is reduced by [COLOR_NEGATIVE_TEXT]1[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Cannot found cities adjacent to foreign borders or while the empire is suffering [ICON_HAPPINESS_3]unhappiness.[ENDCOLOR]'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_STRATEGY', 'Deploy orbital drop colonists to settle across planetary surfaces.'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_PEDIA', 'Space colonization—also known as extraterrestrial settlement—is the establishment of permanent human habitation and resource development beyond Earth. Proponents argue it ensures humanity’s survival against planetary-scale disasters and enables expansion through extraterrestrial resources. Critics warn of the commodification of space, high opportunity costs compared to Earth-based alternatives, and the potential to exacerbate inequality, militarization, and ecological harm. The debate continues as technological capabilities advance and the dream of living beyond Earth becomes closer to reality.'),

-- [[Diplomatic Units]]
-- Augmented Diplomat
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT', 'Augmented Diplomat'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_HELP', 'A diplomatic unit with the [COLOR_PLAYER_PURPLE]Masterful Diplomacy[ENDCOLOR] and [COLOR_PLAYER_PURPLE]Genetic Mod: Photomorphic Camouflage[ENDCOLOR] promotions, making it resistant to capture and highly effective in diplomatic contests.'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_STRATEGY', 'Though expensive, the Augmented Diplomat is vital for pursuing a diplomatic victory. Use it to wrest control of City-States, preserve alliances, and secure dominance in the World Congress to enforce resolutions of your choosing.'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_PEDIA', 'The concept of human augmentation has long been controversial, but humanity has pursued enhancement for centuries. Eyeglasses improved weak vision; hearing aids restored impaired hearing. Future augmentation may involve pharmacological and psychological conditioning to heighten abilities and enforce loyalty. Such methods arose between the mechanical augmentations of robotics and the experimental augmentations of nanotechnology, producing loyal agents without the drawbacks of mechanical bulk or nanotech unpredictability. The Augmented Diplomat embodies this pursuit: a fully loyal emissary enhanced to secure supremacy in international affairs.'),

-- [[Missiles]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Cluster Munition
('TXT_KEY_UNIT_FW_CLUSTER_MISSILE','Cluster Munition'),
('TXT_KEY_UNIT_FW_CLUSTER_MISSILE_TEXT','Cluster munitions contain multiple submunitions within a single casing, dispersing them over a wide area for maximum effect. Originally deployed as aerial bombs, they later evolved for artillery, rockets, and missile systems. Upon release, the casing opens mid-air, scattering bomblets that explode upon ground impact to cause mass casualties and equipment destruction. Used extensively during the Gulf War, such weapons earned the moniker “Steel Rain.” While devastating, their origins trace back to early German Luftwaffe designs in World War II.'),
('TXT_KEY_UNIT_FW_CLUSTER_MISSILE_STRATEGY','Extremely effective against concentrated enemy formations, delivering massive damage at relatively low cost.'),
('TXT_KEY_UNIT_FW_CLUSTER_MISSILE_HELP','A one-use unit that damages all targets within 3 tiles of impact, with diminishing effect at range. [COLOR_POSITIVE_TEXT]Does not use Millitary supply.[ENDCOLOR][NEWLINE][NEWLINE]Requires [ICON_RES_IRON]Iron [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),

-- Plasma Missile
('TXT_KEY_UNIT_FW_HYPERMISSILE','Plasma Missile'),
('TXT_KEY_UNIT_FW_HYPERMISSILE_TEXT','The Plasma Missile combines traditional cluster fragmentation with magnetically contained plasma spheres. Upon detonation, the casing and coils release a burst of plasma, destroying the direct target while inflicting 50% collateral damage within 1 tile. Plasma dissipates quickly in atmosphere, limiting range but making it ideal for close-quarters urban combat and defensive saturation. Standardized casings and coils allowed integration with automated systems and advanced materials engineering, ensuring sustainable mass production.'),
('TXT_KEY_UNIT_FW_HYPERMISSILE_STRATEGY','The next-generation evolution of cluster munitions, dispersing plasma projectiles for area denial.'),
('TXT_KEY_UNIT_FW_HYPERMISSILE_HELP','A one-use unit that damages all targets within 3 tiles of impact, with diminishing effect at range. [COLOR_POSITIVE_TEXT]Does not use Millitary supply.[ENDCOLOR][NEWLINE][NEWLINE]Requires [ICON_RES_IRON]Iron [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),

-- Thermobaric Missile (Plasma Upgrade)
('TXT_KEY_UNIT_FW_THERMOMISSILE','Thermobaric Missile'),
('TXT_KEY_UNIT_FW_THERMOMISSILE_TEXT', 'An advanced evolution of plasma munitions, incorporating metallized fuel aerosols. Upon detonation, ionized plasma ignites the dispersed fuel mist, creating sustained fireballs and devastating overpressure waves. This destroys direct targets and transmits lethal heat and shock through cover, overwhelming even fortified positions. Standardized casings and modular fuel cartridges ensured compatibility with plasma missile lines, while automation and materials science enabled stable mass deployment.'),
('TXT_KEY_UNIT_FW_THERMOMISSILE_STRATEGY','Upgraded version of the Plasma Missile. Inflicts stronger thermal and overpressure collateral damage to adjacent tiles.'),
('TXT_KEY_UNIT_FW_THERMOMISSILE_HELP','A one-use unit that damages all targets within 3 tiles of impact, with diminishing effect at range. [COLOR_POSITIVE_TEXT]Does not use Millitary supply.[ENDCOLOR][NEWLINE][NEWLINE]Requires [ICON_RES_IRON]Iron [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),

-- Ballistic Missile
('TXT_KEY_UNIT_FW_ADVANCED_MISSILE_GUIDED','Ballistic Missile'),
('TXT_KEY_UNIT_FW_ADVANCED_MISSILE_GUIDED_TEXT','Intercontinental Ballistic Missiles (ICBMs) are long-range missiles with ranges exceeding 5,500 km. Ballistic missiles are classified as SRBM (300–1,000 km), MRBM (1,000–3,000 km), IRBM (3,000–5,500 km), and ICBM (≥5,500 km). Modern systems may carry MIRVs (Multiple Independently-targeted Reentry Vehicles) to strike multiple targets simultaneously. Advances in guidance technology greatly reduced circular error probable (CEP), allowing precision strikes. SLBMs (submarine-launched ballistic missiles) add survivability to the nuclear triad (ICBMs, SLBMs, strategic bombers).'),
('TXT_KEY_UNIT_FW_ADVANCED_MISSILE_GUIDED_STRATEGY','The ultimate tool for striking anywhere on the globe.'),
('TXT_KEY_UNIT_FW_ADVANCED_MISSILE_GUIDED_HELP','A one-use unit that can devastate enemy units or garrisons. [COLOR_POSITIVE_TEXT]Does not use Millitary supply.[ENDCOLOR][NEWLINE][NEWLINE]Requires [ICON_RES_OIL]Oil [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),

-- Hypersonic Missile
('TXT_KEY_UNIT_FW_RAILGUN_MISSILE','Hypersonic Missile'),
('TXT_KEY_UNIT_FW_RAILGUN_MISSILE_TEXT','Advances in propulsion led to next-generation missile designs. Equipped with lightweight frames and ramjet engines, these missiles achieve hypersonic speeds, striking before defenses can respond.'),
('TXT_KEY_UNIT_FW_RAILGUN_MISSILE_STRATEGY','The future form of guided missiles, delivering unprecedented speed and reach.'),
('TXT_KEY_UNIT_FW_RAILGUN_MISSILE_HELP','A one-use unit that can devastate enemy units or garrisons. [COLOR_POSITIVE_TEXT]Does not use Millitary supply.[ENDCOLOR][NEWLINE][NEWLINE]Requires [ICON_RES_OIL]Oil [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),

-- Rods from God
('TXT_KEY_UNIT_FW_GOD_ROD','Rods from God'),
('TXT_KEY_UNIT_FW_GOD_ROD_TEXT','“Rods from God” are orbital kinetic weapons deploying dense metal rods (tungsten or iron alloy) without explosives. Dropped from orbit, their sheer kinetic energy penetrates hardened targets before defenses react. Highly effective against bunkers, underground facilities, and fortified structures, guided via orbital satellites and precision reentry calculations.'),
('TXT_KEY_UNIT_FW_GOD_ROD_STRATEGY','A long-range, single-use orbital strike weapon. Inflicts massive damage via kinetic energy. Cannot directly target cities due to orbital treaties.'),
('TXT_KEY_UNIT_FW_GOD_ROD_HELP','A one-use unit that strikes targets at long range. Adjacent units take [COLOR_NEGATIVE_TEXT]40[ENDCOLOR] collateral damage. [COLOR_POSITIVE_TEXT]Does not use Millitary supply.[ENDCOLOR][NEWLINE][NEWLINE]Requires [ICON_RES_IRON]Iron [COLOR_POSITIVE_TEXT]1[ENDCOLOR] and [ICON_RES_NANOMAT]Nanomaterials [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),

-- Rods of Judgment (Upgrade)
('TXT_KEY_UNIT_FW_GOD_ROD2','Rods of Judgment'),
('TXT_KEY_UNIT_FW_GOD_ROD2_TEXT','Second-generation orbital kinetic weapons, equipped with carbon-carbon nosecones, tungsten penetrators, and MHD boundary-layer control to mitigate plasma blackout. Ablative cooling, micro-thrusters, star trackers, and geo-matching enhance terminal accuracy. Upon impact, rods penetrate hardened structures and induce spall shock deep underground. Improved precision and impact density over first-generation designs, though still restricted from city strikes by treaty.'),
('TXT_KEY_UNIT_FW_GOD_ROD2_STRATEGY','An upgraded orbital kinetic weapon. Inflicts enhanced spall shock on hardened and underground targets. (City strikes prohibited).'),
('TXT_KEY_UNIT_FW_GOD_ROD2_HELP','A one-use unit that strikes targets at long range. Adjacent units take [COLOR_NEGATIVE_TEXT]50[ENDCOLOR] collateral damage. [COLOR_POSITIVE_TEXT]Does not use Millitary supply.[ENDCOLOR][NEWLINE][NEWLINE]Requires [ICON_RES_IRON]Iron [COLOR_POSITIVE_TEXT]1[ENDCOLOR] and [ICON_RES_NANOMAT]Nanomaterials [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),

-- Hydrogen Bomb
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB', 'Hydrogen Bomb'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_TEXT', 'The hydrogen bomb employs fusion of deuterium and tritium isotopes to unleash enormous energy. Unlike fission weapons, advanced fusion-only designs theoretically require no fissile core, potentially simplifying clandestine development. Traditional nuclear proliferation control relies on limiting access to fissile materials such as uranium-235 and plutonium-239.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_DESC', 'Unleash devastation upon enemy cities and units. [NEWLINE][NEWLINE]Requires the [COLOR_POSITIVE_TEXT]Manhattan Project[ENDCOLOR] and 1 [ICON_RES_URANIUM]Uranium.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_STRATEGY', 'A weapon of mass destruction. Modern missile technology improves evasion, but devastation remains immense. [NEWLINE][NEWLINE]Requires the [COLOR_POSITIVE_TEXT]Manhattan Project[ENDCOLOR] and 1 [ICON_RES_URANIUM]Uranium.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_HELP', 'Upon detonation, devastates all units and cities within 2 tiles. Consumed on use.'),

-- Micro-Fusion Bomb
('TXT_KEY_UNIT_FW_THERMONUCLEAR_BOMB','Micro-Fusion Bomb'),
('TXT_KEY_UNIT_FW_THERMONUCLEAR_BOMB_TEXT','The micro-fusion bomb represents a leap beyond conventional nuclear science. It employs nanocatalysts to induce extreme temperature and pressure, enabling compact fusion ignition within miniature warheads. This reduces size while maximizing destructive yield.'),
('TXT_KEY_UNIT_FW_THERMONUCLEAR_BOMB_STRATEGY','A one-use nuclear weapon detonating with catastrophic effect, devastating all units and cities within 2 tiles.'),
('TXT_KEY_UNIT_FW_THERMONUCLEAR_BOMB_HELP','Delivers catastrophic destruction, even deployable from orbit thanks to lightweight warhead design. [NEWLINE][NEWLINE]Requires the [COLOR_POSITIVE_TEXT]Manhattan Project[ENDCOLOR]. Requires [ICON_RES_URANIUM]Uranium [COLOR_POSITIVE_TEXT]1[ENDCOLOR] and [ICON_RES_NANOMAT]Nanomaterials [COLOR_POSITIVE_TEXT]1[ENDCOLOR].'),

-- [[Tanks]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Railgun Tank
('TXT_KEY_UNIT_FW_RAILGUN_TANK','Railgun Tank'),
('TXT_KEY_UNIT_FW_RAILGUN_TANK_TEXT','Conventional tank armaments were steadily refined for decades, but electromagnetic rail weapons promised far greater destructive potential. Traditional cannons adopted sabot rounds to penetrate armor, concentrating energy into narrow profiles. Railguns accelerate similar projectiles at even higher velocities, delivering unprecedented penetrative power. First deployed aboard naval vessels, advancements in energy generation and power systems eventually made vehicle-mounted railguns feasible.'),
('TXT_KEY_UNIT_FW_RAILGUN_TANK_STRATEGY','A late-future armored unit and the first to benefit from [ICON_RES_NANOMAT] Nanomaterials.'),
('TXT_KEY_UNIT_FW_RAILGUN_TANK_HELP','One of the earliest future units to gain advantages from [ICON_RES_NANOMAT] Nanomaterials.'),

-- Zeke
('TXT_KEY_UNIT_FW_ZEKE','Zeke'),
('TXT_KEY_UNIT_FW_ZEKE_TEXT','Unlike traditional tanks, the Zeke is a powerful bipedal combat unit. Advances in robotics and AI allowed precise control of balance and articulation, granting mobility even across rivers and marshes where tracked vehicles falter. Elevated vantage points improved battlefield visibility, but also made it vulnerable to lower-profile armored fire. Developed in response to fast-moving bioengineered units like the Tyrannosaurus and Chimera, the Zeke’s bipedal design enabled rapid pursuit and unrestricted maneuver across difficult terrain.'),
('TXT_KEY_UNIT_FW_ZEKE_STRATEGY','A powerful bipedal mech unit. Can cross rivers and move after attacking.'),
('TXT_KEY_UNIT_FW_ZEKE_HELP','Slower than a Railgun Tank, but capable of river crossing and extended vision.'),

-- [[Air-Recon Units]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Dirigible (CBP)
('TXT_KEY_UNIT_ZEPPELIN_CBP','Steam Dirigible'),
('TXT_KEY_CIV5_ZEPPELIN_TEXT_CBP','Early powered flight drew upon lighter-than-air craft. With the advent of steam engines, airships gained maneuverability. During the American Civil War, tethered observation balloons—not powered airships—first demonstrated military value for reconnaissance and communications.'),
('TXT_KEY_UNIT_ZEPPELIN_STRATEGY_CBP','Industrial Era air-recon unit. Use to patrol borders, scout enemy fleets, and strike vulnerable cities or counter armor.'),
('TXT_KEY_UNIT_HELP_ZEPPELIN_CBP','Industrial Era air-recon unit. Can hover over mountains and seas.'),

-- WWI Zeppelin
('TXT_KEY_UNIT_WWI_ZEPPELIN','Zeppelin'),
('TXT_KEY_UNIT_WWI_ZEPPELIN_TEXT','Named after Count Ferdinand von Zeppelin, the Zeppelin pioneered rigid airship design in early 20th century Germany. Patented in Germany (1895) and the US (1899), Zeppelins became the world’s first commercial airline service under DELAG in 1910, carrying over 10,000 passengers by 1914. In World War I, Germany used Zeppelins extensively for bombing and reconnaissance, with raids over Britain killing more than 500 civilians.'),
('TXT_KEY_UNIT_WWI_ZEPPELIN_STRATEGY','A strong modern airship unit. Use to observe borders and detect submarines.'),
('TXT_KEY_UNIT_WWI_ZEPPELIN_HELP','Modern Era recon unit. Effective at detecting submarines. Can hover over mountains and seas.'),

-- CAS Fighter
('TXT_KEY_UNIT_PREDATOR_DRONE','CAS'),
('TXT_KEY_UNIT_PREDATOR_DRONE_TEXT','Close Air Support (CAS) aircraft operate at low altitude and speed to deliver precision strikes in support of ground forces. Equipped with targeting pods, EO/IR sensors, SAR radar, and datalinks, they integrate with forward observers and JTACs. Armed with cannons, rockets, and precision-guided munitions, they neutralize armor, artillery, and infantry positions swiftly. However, their low-altitude mission profile leaves them vulnerable to AAA, SAMs, and interceptors, requiring air superiority and SEAD support.'),
('TXT_KEY_UNIT_PREDATOR_DRONE_STRATEGY','An Information Era air-recon unit specialized against ground forces. Redeploy near the front to eliminate armor and artillery, coordinating with scouts and radar. Vulnerable to air defenses—ensure air cover and SEAD before employment.'),
('TXT_KEY_UNIT_PREDATOR_DRONE_HELP','Information Era recon unit effective at border surveillance and submarine detection. Can hover over mountains and seas.'),

-- Advanced UAV
('TXT_KEY_UNIT_FW_MODERN_DRONE','UAV'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_HELP','An Information Era recon unit specialized in border surveillance, submarine detection, and anti-armor combat. Can hover over mountains and seas.'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_STRATEGY','The most advanced recon platform for submarine detection. Use UAVs as your eyes across the battlefield.'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_TEXT','Unmanned Aerial Vehicles (UAVs), or drones, are remotely piloted aircraft widely adopted for reconnaissance and strike missions. Employed where human presence is too dangerous, tedious, or costly, UAVs are central to modern military doctrine. Advanced nations anticipate future warfare will increasingly depend upon drones for intelligence and combat alike.'),

-- Hybrid Drone
('TXT_KEY_UNIT_FW_HYBRID_DRONE','Hybrid Drone'),
('TXT_KEY_UNIT_FW_HYBRID_DRONE_TEXT','Experimental research combining organic marine tissue with alloys led to a novel fusion platform: the Hybrid Drone. Mimicking regenerative abilities of marine organisms, its alloys partially self-repair. Though effective, the drone displayed instinctive, predatory behavior—often targeting submarines and armor as if hunting prey.'),
('TXT_KEY_UNIT_FW_HYBRID_DRONE_STRATEGY','A hovering future recon unit, self-repairing each turn.'),
('TXT_KEY_UNIT_FW_HYBRID_DRONE_HELP','Future Era recon unit specialized against submarines and armor. Regenerates HP each turn. Can hover over mountains and coasts.'),

-- Bio-Drone
('TXT_KEY_UNIT_FW_BIODRONE','Bio-Drone'),
('TXT_KEY_UNIT_FW_BIODRONE_TEXT','Advances in biotechnology yielded the Bio-Drone: a semi-organic drone with heightened instincts. Capable of detecting submarines and camouflaged infantry, it self-repairs using engineered regenerative tissue. Its animal-like responses made it a formidable predator across land and sea.'),
('TXT_KEY_UNIT_FW_BIODRONE_STRATEGY','An ultimate future recon unit, combining aerial, land, and naval adaptability. Effective at rapid-response terror suppression.'),
('TXT_KEY_UNIT_FW_BIODRONE_HELP','A very powerful recon unit. Self-heals each turn, moves quickly, detects submarines, and counters armor. Can hover over mountains and seas.'),

-- [[Helicopters]]
-- Ka-52 Alligator
('TXT_KEY_UNIT_FW_APACHE','Alligator'),
('TXT_KEY_UNIT_FW_APACHE_HELP','An advanced Information Era attack helicopter specialized against armor and tanks. Can hover over mountains and coasts.'),
('TXT_KEY_UNIT_FW_APACHE_STRATEGY','Deadly in ground maneuver warfare short of city capture. High mobility, anti-tank firepower, and terrain-ignoring movement allow it to rapidly destroy armored forces.'),
('TXT_KEY_UNIT_FW_APACHE_TEXT','The Ka-52 “Alligator” is a next-generation attack helicopter with coaxial rotors and tandem crew. Mast-mounted radar, EO/IR sensors, and helmet-mounted sights allow detection and engagement in all weather and at night. Armed with a 30mm cannon, ATGMs, and guided rockets, protected by composite armor and active defenses, and datalinked with UAVs and ground units for cooperative engagement.'),

-- V/STOL Gunship
('TXT_KEY_UNIT_FW_VERTOL','V/STOL Gunship'),
('TXT_KEY_UNIT_FW_VERTOL_TEXT','The advent of Vertical Take-Off and Landing (V/STOL) technology introduced diverse new airframe designs beyond standard helicopters. Powered by rotating jet turbines or vectored thrust, these aircraft earned the shorthand “Vertols.”'),
('TXT_KEY_UNIT_FW_VERTOL_STRATEGY','A Future Era helicopter unit designed for anti-armor roles. Can cross seas, though unable to attack from them.'),
('TXT_KEY_UNIT_FW_VERTOL_HELP','A counter-armor unit specialized against modern and railgun tanks. Can hover over mountains and seas.'),

-- Hover Tank
('TXT_KEY_UNIT_FW_HOVERTANK','Hover Tank'),
('TXT_KEY_UNIT_FW_HOVERTANK_TEXT','Long imagined in science fiction, the hover tank became feasible with advances in materials science, energy generation, and control systems. Equipped with sufficient armor and sophisticated control suites, hover tanks rival traditional armor in firepower and resilience. Often armed with EMP warheads for countering augmented infantry, they proved devastating against advanced armored targets.'),
('TXT_KEY_UNIT_FW_HOVERTANK_STRATEGY','A Future Era unit designed to counter enemy armor.'),
('TXT_KEY_UNIT_FW_HOVERTANK_HELP','Specialized against Railgun Tanks and annihilation robots. Can hover over mountains and seas.'),

-- [[SAM]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Mobile SAM Launcher
('TXT_KEY_UNIT_FW_MODERN_MOBILE_SAM','Mobile SAM Launcher'),
('TXT_KEY_UNIT_FW_MODERN_MOBILE_SAM_STRATEGY','Provides forward air defense for advancing forces. Intercepts bombing aircraft within 4 tiles (once per turn). Vulnerable to ground attack—escort with infantry or armor.'),
('TXT_KEY_UNIT_FW_MODERN_MOBILE_SAM_HELP','Intercepts enemy aircraft attempting bombing runs nearby. Can load 2 missiles.'),
('TXT_KEY_UNIT_FW_MODERN_MOBILE_SAM_PEDIA','As jets and helicopters grew deadlier, infantry required stronger defenses. Modern SAMs are fast, light, radar-guided weapons that deliver lethal strikes against fragile aircraft. In turn, stealthier planes and advanced countermeasures emerged, but SAMs remain vital shields against air threats.'),

-- Neuro-SAM
('TXT_KEY_UNIT_FW_CYBERSAM','Neuro-SAM Launcher'),
('TXT_KEY_UNIT_FW_CYBERSAM_HELP','Intercepts enemy aircraft attempting bombing runs. Can load 3 missiles.'),
('TXT_KEY_UNIT_FW_CYBERSAM_STRATEGY','Provides air defense within 4 tiles (one intercept per turn). Highly vulnerable to ground attacks—escort is essential.'),
('TXT_KEY_UNIT_FW_CYBERSAM_PEDIA','As helicopters and fighters advanced, traditional SAMs struggled. Neuro-SAMs combine neuro-quantum systems and bio-sensory arrays, mimicking instinctive reactions. “Spider Sensors” detect electromagnetic and airflow changes, even against stealth aircraft, forming inescapable detection webs. Resistant to jamming, they represent a new dimension of air defense.'),

-- Crawler SAM
('TXT_KEY_UNIT_FW_CRAWLER','Crawler SAM Launcher'),
('TXT_KEY_UNIT_FW_CRAWLER_TEXT','Crawler SAMs revolutionized logistics with onboard reactors and in-situ missile fabrication. Producing their own plasma missiles, they defend airspace while supplying nearby forces. These units solved resupply bottlenecks and provided unmatched flexibility on the battlefield.'),
('TXT_KEY_UNIT_FW_CRAWLER_STRATEGY','An anti-air unit carrying 4 missiles. 25% chance per turn to generate a guided missile (consumes resources). [NEWLINE][NEWLINE][COLOR_YELLOW]Limited to 4 per civilization.[ENDCOLOR]'),
('TXT_KEY_UNIT_FW_CRAWLER_HELP','Carries 4 missiles and can fire 4 times per turn. [NEWLINE][NEWLINE][COLOR_YELLOW]Limited to 4 per civilization.[ENDCOLOR]'),

-- [[Siege Weapons]]
-- Mobile MLRS
('TXT_KEY_UNIT_FW_HIMARS','Mobile Rocket Launcher'),
('TXT_KEY_UNIT_FW_HIMARS_TEXT','Unlike guns that rely on propellant charges, rocket artillery uses self-propelled rockets. Lighter launchers with devastating firepower became highly mobile siege units. Later systems added mid-flight guidance, increasing accuracy and lethality.'),
('TXT_KEY_UNIT_FW_HIMARS_STRATEGY','A terrifyingly strong siege unit, stronger than self-propelled artillery. Does not slow in enemy territory, delivers immense bombardment, but requires protection against infantry and armor. Limited line of sight offset by indirect fire.'),
('TXT_KEY_UNIT_FW_HIMARS_HELP','An early Future Era siege unit. Can carry 1 missile.'),

-- Mech Artillery
('TXT_KEY_UNIT_FW_MECH_ARTILLERY','Mech Artillery'),
('TXT_KEY_UNIT_FW_MECH_ARTILLERY_TEXT','Though wheels and tracks remained practical, the concept of legged combat vehicles captivated engineers. Early prototypes crossed terrain impassable to traditional armor, supported by auxiliary wheeled drives. Their articulated frames struggled with recoil, but proved invaluable as artillery platforms, firing from otherwise unreachable positions.'),
('TXT_KEY_UNIT_FW_MECH_ARTILLERY_STRATEGY','A Future Era siege unit.'),
('TXT_KEY_UNIT_FW_MECH_ARTILLERY_HELP','A powerful Future Era artillery unit. Can carry 1 missile.'),

-- Angel
('TXT_KEY_UNIT_FW_ANGEL','Angel'),
('TXT_KEY_UNIT_FW_ANGEL_TEXT','Developed to overcome weaknesses of earlier mech artillery, the Angel fused advanced materials, compact fusion reactors, and plasma weaponry. Its defensive barrier system resists heavy strikes and melee assaults alike, while fusion-driven plasma cannons deliver overwhelming offensive power. Serving as both frontline spearhead and rear fire support, Angels embody the pinnacle of future siege warfare.'),
('TXT_KEY_UNIT_FW_ANGEL_STRATEGY','A siege unit capable of carrying 1 missile. 25% chance per turn to auto-generate a thermobaric missile (consumes resources). Limited to 4 units per civilization.'),
('TXT_KEY_UNIT_FW_ANGEL_HELP','A supremely powerful Future Era siege unit. Can carry 1 missile. [COLOR_YELLOW]Limited to 4 per civilization.[ENDCOLOR]'),


-- [[Powered Infantry]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Power Armor Infantry
('TXT_KEY_UNIT_FW_POWER_ARMOR_INFANTRY','Power Armor Infantry'),
('TXT_KEY_STRATEGY_UNIT_FW_POWER_ARMOR_INFANTRY','Stronger and faster to field than regular infantry. Fast, but cannot move after attacking (like tanks). Their core duty remains to seize and hold ground.'),
('TXT_KEY_HELP_UNIT_FW_POWER_ARMOR_INFANTRY','A fast, baseline Future Era infantry unit that requires no strategic resources.'),
('TXT_KEY_CIVIL_UNIT_FW_POWER_ARMOR_INFANTRY','Power Armor (also called Powered Suit, Cybernetic Suit/Armor, Exosuit, Hardsuit, Exoframe, or Augmented Mobility) augments a user’s strength and endurance via electric motors, pneumatics, levers, hydraulics, and sensor-actuated control. Early exoskeleton-like devices date back to 1890 (Nicholas Yagn’s assist apparatus), and modern powered suits now see medical, industrial, civil, and military use.'),

-- Battlesuit
('TXT_KEY_UNIT_FW_BATTLESUIT','Battlesuit'),
('TXT_KEY_UNIT_FW_BATTLESUIT_TEXT','Battlesuits offered unmatched protection and strength but still relied on human pilots. As massive bio-beasts like the Tyrannosaurus and Chimera appeared, human agility and judgment again proved decisive. Thus, piloted bipedal armor—capable of fine manipulation—was fielded to counter colossal threats and later repurposed for civil tasks. The balance between automated efficiency and human-directed flexibility became clear.'),
('TXT_KEY_UNIT_FW_BATTLESUIT_STRATEGY','A Future Era infantry unit. Like tanks, cannot move after attacking. Built to take and hold ground.'),
('TXT_KEY_UNIT_FW_BATTLESUIT_HELP','Future infantry with solid ranged resilience and anti-cavalry defense.'),

-- Gundam
('TXT_KEY_UNIT_FW_GUNDAM','Gundam'),
('TXT_KEY_UNIT_FW_GUNDAM_TEXT','A powerful defensive, piloted bipedal platform. Mastery of center-of-mass and joint control grants superior mobility; boosters allow movement across rivers and wetlands. Elevated stance improves situational awareness but can invite fire from low-profile tanks. Unlike autonomous “Zeke” and exterminator bots, the Gundam is human-piloted—an answer that amplifies human skill without genetic or digital assimilation.'),
('TXT_KEY_UNIT_FW_GUNDAM_STRATEGY','A strong defensive humanoid weapons platform. Counter “cavalry-like” monsters; can cross rivers.'),
('TXT_KEY_UNIT_FW_GUNDAM_HELP','A robust defensive mech effective versus mounted-style units. Gains vision; can cross rivers.[NEWLINE][NEWLINE][COLOR_CYAN]The wind is calm—no problem.'),

-- [[Bio Infantry]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Bio-Enhanced Infantry
('TXT_KEY_UNIT_FW_BIOINFANTRY','Bio-Enhanced Infantry'),
('TXT_KEY_UNIT_FW_BIOINFANTRY_TEXT','Advances in genetic engineering and forced tissue growth boosted development of organic composites and implants, yielding regenerative ballistic protection and combat augmentations for soldiers.'),
('TXT_KEY_UNIT_FW_BIOINFANTRY_STRATEGY','A Future Era infantry unit.'),
('TXT_KEY_UNIT_FW_BIOINFANTRY_HELP','Elite Future Era infantry requiring no strategic resources.'),

-- Clone Trooper
('TXT_KEY_UNIT_FW_CLONETROOPER','Clone Trooper'),
('TXT_KEY_UNIT_FW_CLONETROOPER_TEXT','These troops are derivatives of preserved originals, raising questions of identity and dignity. Bred as soldiers from birth, they form powerful armies at ethical cost, instrumentalizing life for war.'),
('TXT_KEY_UNIT_FW_CLONETROOPER_STRATEGY','Future Era infantry that regenerates HP each turn.'),
('TXT_KEY_UNIT_FW_CLONETROOPER_HELP','Produced with Xenospore in the Future Era. Self-heals each turn.'),

-- Bio Trooper
('TXT_KEY_UNIT_FW_BIOTROOPER','Bio Trooper'),
('TXT_KEY_UNIT_FW_BIOTROOPER_TEXT','Biological modification advanced to the point of extensive morphing beyond human appearance. “Biotroopers” rival powered infantry in speed and durability with lighter logistics and combat regeneration, though their presence can unsettle less-modified troops.'),
('TXT_KEY_UNIT_FW_BIOTROOPER_STRATEGY','A Future Era infantry unit.'),
('TXT_KEY_UNIT_FW_BIOTROOPER_HELP','Elite Future Era infantry. Excels at harassment deep in enemy territory.[NEWLINE][NEWLINE][COLOR:255:173:69:255]I’ll stay with you to the end!'),

-- Super Soldiers
('TXT_KEY_UNIT_FW_SUPERSOLDIERS','Super Soldiers'),
('TXT_KEY_UNIT_FW_SUPERSOLDIERS_TEXT','“Supersoldiers” exceed normal human limits via genetic alteration, implants, cybernetics, drugs, conditioning, or extreme training—common across military sci-fi. Their programs often challenge ethical boundaries in pursuit of military advantage.'),
('TXT_KEY_UNIT_FW_SUPERSOLDIERS_STRATEGY','Stealth raiders for deep incursions. Detected by recon drones, destroyers, and submarines; also revealed if they attack or end adjacent to enemies. Ideal for sabotage, assassinations, and disrupting spaceship parts logistics.'),
('TXT_KEY_UNIT_FW_SUPERSOLDIERS_HELP','Elite infiltrators with [COLOR_PLAYER_PURPLE]Genetic Mod: Photomorphic Camouflage[ENDCOLOR]. Not detected unless attacking, within detection units’ vision, or adjacent to units. Operate behind enemy lines.[NEWLINE][NEWLINE][COLOR:255:173:69:255]I could do this all day!'),

-- [[Mercenaries]]  -----------------------------------------------------------------------------------------------------------------------------------
('TXT_KEY_UNIT_CAYM_PMC','Professional Mercenary'),
('TXT_KEY_UNIT_FW_ELITE_MERCENARIES','Gene-Selected Mercenary'),
('TXT_KEY_UNIT_FW_ORGANIC_MERCENARIES','Bio-Enhanced Mercenary'),
('TXT_KEY_UNIT_FW_ENHANCED_MERCENARIES','Bio-Enhanced Mercenary'),
('TXT_KEY_UNIT_FW_BIO_MERCENARIES','Bio-Augmented Mercenary'),

-- [[Ranged/AT]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Javelin
('TXT_KEY_UNIT_FW_ATGM','Javelin'),
('TXT_KEY_UNIT_FW_ATGM_STRATEGY','A long-range anti-armor unit (Range 3) with high damage versus tanks but low mobility and weaker defense. Best used for attrition and “hit-and-run.” Deals extra damage to armored units and weakens nearby enemies.'),
('TXT_KEY_CIVILOPEDIA_UNITS_FW_ATGM_TEXT','Javelin ATGMs are pivotal guerrilla assets—detecting armor and striking from range. Devastating versus vehicles and positions, but limited in mobility and resilience—suited to ambush and quick withdrawal.'),
('TXT_KEY_UNIT_FW_HELP_ATGM','An upgraded Information Era ranged unit. Inflicts heavy damage on armored units.'),

-- Automaton
('TXT_KEY_UNIT_FW_AUTOMATON','Automaton'),
('TXT_KEY_UNIT_FW_AUTOMATON_TEXT','Since the first robots, combat automata have been envisioned. Early remote machines appeared in WWII; true autonomous weapons awaited advances in perception and cognition.'),
('TXT_KEY_UNIT_FW_AUTOMATON_STRATEGY','Cheap, scalable Future Era ranged unit—stronger in numbers. Produced faster in cities with Automated Plants and Unmanned Hubs.'),
('TXT_KEY_UNIT_FW_AUTOMATON_HELP','Low-cost, mass-producible Future Era ranged unit. Power increases with clustering.'),

-- Robot Infantry
('TXT_KEY_UNIT_FW_ROBOT_INFANTRY','Robot Legion'),
('TXT_KEY_UNIT_FW_ROBOT_INFANTRY_TEXT','With advanced AI, humanoid robot legions emerged—self-directed, persistent, and precise at long range. Societies that fielded them found them highly effective and relatively easy to repurpose in peacetime.'),
('TXT_KEY_UNIT_FW_ROBOT_INFANTRY_STRATEGY','A stronger anti-armor ranged unit than Automatons; scales with numbers.'),
('TXT_KEY_UNIT_FW_ROBOT_INFANTRY_HELP','Upgraded Future Era ranged unit; grows stronger when massed.[NEWLINE][NEWLINE][COLOR_YELLOW]I’ll be back!'),

-- Colossus
('TXT_KEY_UNIT_FW_COLOSSUS','Colossus'),
('TXT_KEY_UNIT_FW_COLOSSUS_TEXT','The Colossus, a giant platform with high-output plasma artillery and layered protection, anchors the CNDR (Cognitive Neuroelectronic Defense Registry). It synchronizes drones, artillery, and armor along priority axes, isolates compromised nodes, and forces/recalls local command to align strike timing—“more, faster, focused.”'),
('TXT_KEY_UNIT_FW_COLOSSUS_STRATEGY','A powerful long-range robotic platform mounting a plasma launcher. Defensive lynchpin with heavy firepower.'),
('TXT_KEY_UNIT_FW_COLOSSUS_HELP','Massive plasma-armed robot; excels at command-synchronized defense and fire. Can move after attacking.[NEWLINE][NEWLINE][COLOR_YELLOW]Your existence was foretold; resistance will crumble.'),

-- [[Engineers / Airborne]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Airborne Forces
('TXT_KEY_UNIT_FW_AIRBORNE_FORCES','Airborne Forces'),
('TXT_KEY_UNIT_HELP_FW_AIRBORNE_FORCES','A powerful infantry unit capable of paradrops from friendly territory. Can move and pillage after drop, but cannot fight until next turn.'),
('TXT_KEY_UNIT_FW_AIRBORNE_FORCES_STRATEGY','Information Era engineer unit. Can paradrop up to 40 tiles when starting in friendly lands—leapfrog lines to cut roads, pillage key resources, and sow chaos. High risk; choose targets wisely.'),
('TXT_KEY_CIV5_FW_AIRBORNE_FORCES_TEXT','Airborne units deploy by aircraft, usually via parachute, allowing surprise insertion almost anywhere—limited mainly by lift capacity. They can infiltrate cities pre-assault or strike from the rear.'),

-- Orbital Drop Shock Trooper
('TXT_KEY_UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER','Orbital Drop Shock Trooper'),
('TXT_KEY_UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER_TEXT','Designed for near-instant global response, ODSTs ride heat-shielded capsules with impact mitigation and terminal guidance for precise drops. As space launch matured, orbital insertion became a practical tool for counter-terror and rapid crisis response.'),
('TXT_KEY_UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER_STRATEGY','Rapid-response infantry, deployable anywhere in sight radius on short notice. Ambush lines, seize strategic tiles, reinforce urgently, or simply hold the front—few tasks are beyond them.'),
('TXT_KEY_UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER_HELP','Fast, powerful Future Era infantry. If starting in friendly territory, can airdrop anywhere on the map.'),

-- Space Marines
('TXT_KEY_UNIT_FW_SPACEMARINES','Space Marines'),
('TXT_KEY_UNIT_FW_SPACEMARINES_HELP','A strong recon-capable ground unit that paradrops from friendly territory. Can move and pillage after dropping, but cannot fight until next turn.[NEWLINE][NEWLINE][COLOR_CYAN]Guide us with His might in endless war.'),
('TXT_KEY_UNIT_FW_SPACEMARINES_STRATEGY','Late-game recon ground unit assisting city assaults. Can orbital-drop from friendly lands to disrupt roads and resources behind enemy lines.'),
('TXT_KEY_UNIT_FW_SPACEMARINES_TEXT','Space Marines (Adeptus Astartes) are superhuman guardians of mankind, enhanced through genetic alteration, conditioning, and brutal training. Their layered ceramite/adamantium armor (e.g., Terminator suits) interfaces with nerve and muscle bundles for amplified movement.'),

-- [[Genetic Units]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Gene-Mutant Swarm
('TXT_KEY_UNIT_FW_SWARM','Gene-Mutant Swarm'),
('TXT_KEY_UNIT_FW_SWARM_TEXT','Early combat chimeras were short-lived and crude, later re-evaluated after the rise of bio-titans. Deployed mainly to disrupt and confuse, swarms rushed enemy lines relentlessly, sacrificing survivability for pressure and chaos.'),
('TXT_KEY_UNIT_FW_SWARM_STRATEGY','A Future Era land unit.'),
('TXT_KEY_UNIT_FW_SWARM_HELP','A mobile but fragile Future Era unit requiring no strategic resources.[NEWLINE][NEWLINE][COLOR_PLAYER_ORANGE]On attack, spreads a potent neurotoxin lasting 3 turns.'),

-- Chimera
('TXT_KEY_UNIT_FW_CHIMERA','Chimera'),
('TXT_KEY_UNIT_FW_CHIMERA_TEXT','With advanced genetics, entirely new organisms were tailored for war. Predatory instinct, speed across rough terrain, and adaptive camouflage made chimeras terrifying opponents.'),
('TXT_KEY_UNIT_FW_CHIMERA_STRATEGY','A fast “mounted” land unit of the Future Era.'),
('TXT_KEY_UNIT_FW_CHIMERA_HELP','Fast-moving land unit that self-heals each turn.[NEWLINE][NEWLINE][COLOR_PLAYER_ORANGE]On attack, spreads a potent neurotoxin lasting 3 turns.'),

-- [[Dinosaurs]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Tyrannosaurus
('TXT_KEY_UNIT_FW_TREX','Tyrannosaurus'),
('TXT_KEY_UNIT_FW_TREX_TEXT','Reviving T. rex was inevitable. Genetically engineered park specimens were powerful and swift but difficult to handle once they bolted.'),
('TXT_KEY_UNIT_FW_TREX_STRATEGY','An aggressive dinosaur unit escaped from Jurassic Park; excels at hunting in open terrain.'),
('TXT_KEY_UNIT_FW_TREX_HELP','Offensive dinosaur unit with no cost. Stronger on open ground.'),

-- Triceratops
('TXT_KEY_UNIT_FW_TRICERATOPS','Triceratops'),
('TXT_KEY_UNIT_FW_TRICERATOPS_TEXT','Symbol of herbivores—slow but massively protected by hide and bone. Some escapees required anti-armor weapons for removal.'),
('TXT_KEY_UNIT_FW_TRICERATOPS_STRATEGY','A defensive dinosaur unit escaped from Jurassic Park. Costs nothing and can overturn heavy vehicles.'),
('TXT_KEY_UNIT_FW_TRICERATOPS_HELP','Defensive dinosaur unit with no cost. Fights better versus armored units.'),

-- Velociraptor
('TXT_KEY_UNIT_FW_RAPTOR','Velociraptor'),
('TXT_KEY_UNIT_FW_RAPTOR_TEXT','The most fearsome engineered raptor—clever, fast, and escape-prone. Weaker than a T. rex or Triceratops, but extremely hard to hunt once loose.'),
('TXT_KEY_UNIT_FW_RAPTOR_STRATEGY','A mobile dinosaur scout unit escaped from Jurassic Park. No cost; gains strength in Forest/Jungle.'),
('TXT_KEY_UNIT_FW_RAPTOR_HELP','Recon dinosaur unit with no cost. Stronger in Forest and Jungle.'),
-- [[Fast Boats]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Gunboat
('TXT_KEY_UNIT_FW_GUNBOAT', 'Gunboat'),
('TXT_KEY_UNIT_FW_GUNBOAT_HELP', 'A fast ranged naval unit. Can detect submarines; starts with [COLOR_PLAYER_PURPLE]Move After Attack[ENDCOLOR] and [COLOR_PLAYER_PURPLE]Skyranger[ENDCOLOR]. Slower on Ocean tiles. [NEWLINE][NEWLINE]Limited to [COLOR_YELLOW]4[ENDCOLOR] per civilization.'),
('TXT_KEY_UNIT_FW_GUNBOAT_STRATEGY', 'A small, air-transportable fast craft—but weak in fleet actions. Use it to scout coasts and raid. Limited to 4 per civ.'),
('TXT_KEY_UNIT_FW_GUNBOAT_TEXT', 'Unlike warships built for fleet actions or transport, gunboats mount one or more guns specifically to patrol, scout, and harass coastal targets—trading staying power for speed to outrun conventional ships.'),

-- Advanced Gunboat
('TXT_KEY_UNIT_FW_ADV_GUNBOAT', 'Advanced Gunboat'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_HELP', 'An extremely fast ranged naval unit. Detects submarines; starts with [COLOR_PLAYER_PURPLE]Move After Attack[ENDCOLOR] and [COLOR_PLAYER_PURPLE]Orbital Drop[ENDCOLOR]. Slower on Ocean tiles. [NEWLINE][NEWLINE]Limited to [COLOR_YELLOW]4[ENDCOLOR] per civilization.'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_STRATEGY', 'Still weak in fleet combat; excel at sea control, scouting, and pillaging. Limited to 4 per civ.'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_TEXT', 'Ultra-fast hulls refined from gunboat designs. Added emergency missile racks improve standoff punch while retaining pursuit speed against conventional vessels.'),

-- [[Destroyers]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Zumwalt-class Destroyer
('TXT_KEY_UNIT_FW_NEODESTROYER','Zumwalt-class Destroyer'),
('TXT_KEY_UNIT_FW_NEODESTROYER_TEXT','Modern destroyers became the surface fleet standard: low-RCS shaping, integrated masts, and large VLS banks paired with flight decks. Sensor fusion and combat systems allow simultaneous defense against ballistic/cruise missiles, aircraft, and ships.'),
('TXT_KEY_UNIT_FW_NEODESTROYER_STRATEGY','A future-form missile destroyer. Very strong, very expensive; tracks subs at range and counters air threats efficiently.'),
('TXT_KEY_UNIT_FW_NEODESTROYER_HELP','A powerful melee naval unit with 4 missile slots. Detects submarines at long range and excels at ASW and air defense.'),

-- Neuro Railgun Destroyer
('TXT_KEY_UNIT_FW_RAILGUN_DESTROYER','Neuro Railgun Destroyer'),
('TXT_KEY_UNIT_FW_RAILGUN_DESTROYER_TEXT','A next-gen combatant fusing BCI-based neurosystems with ship AI. “Spider” sensors capture fine EM, pressure, and thermal cues; bio-quantum cores predict threat motion and cue railgun interceptions with reflex-like latency.'),
('TXT_KEY_UNIT_FW_RAILGUN_DESTROYER_STRATEGY','Elite melee naval unit—hunts subs at long range and defeats air threats.'),
('TXT_KEY_UNIT_FW_RAILGUN_DESTROYER_HELP','Future Era melee warship. Sees submarines at range; mounts 4 missiles.'),

-- Bio Destroyer
('TXT_KEY_UNIT_FW_BIO_DESTROYER','Bio Destroyer'),
('TXT_KEY_UNIT_FW_BIO_DESTROYER_TEXT','Biotech hull treatments and bio-inspired defenses yield higher speed and self-repair. Advanced hydrodynamics and sensor biology enable deep-ocean ASW and coastal dominance with improved survivability.'),
('TXT_KEY_UNIT_FW_BIO_DESTROYER_STRATEGY','Top-tier melee naval unit—tracks subs from afar and counters all aerial threats.'),
('TXT_KEY_UNIT_FW_BIO_DESTROYER_HELP','Ultimate Future Era melee combatant. Self-heals each turn; detects submarines; carries 4 missiles.'),

-- [[Cruisers]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Arsenal Ship
('TXT_KEY_UNIT_FW_ARSENAL_SHIP','Arsenal Ship'),
('TXT_KEY_UNIT_FW_ARSENAL_SHIP_TEXT','A floating missile magazine concept with hundreds of VLS cells, remotely taskable by fleet C2. Emphasizes massed precision strike over organic sensors.'),
('TXT_KEY_UNIT_FW_ARSENAL_SHIP_STRATEGY','Future successor to the Missile Cruiser. Carries 4 missile units and delivers heavy ranged fire.'),
('TXT_KEY_UNIT_FW_ARSENAL_SHIP_HELP','Evolution of the missile cruiser—4 missile slots and very strong ranged attack.'),

-- Neuro Railgun Cruiser
('TXT_KEY_UNIT_FW_RAILGUN_CRUISER','Neuro Railgun Cruiser'),
('TXT_KEY_UNIT_FW_RAILGUN_CRUISER_TEXT','A railgun-armed cruiser with BCI neurosystems and bio-quantum prediction. “Spider” sensor webs extend horizon detection; reflexive fire control compresses the enemy’s response window to near-zero across siege, AAW, and ASuW roles.'),
('TXT_KEY_UNIT_FW_RAILGUN_CRUISER_STRATEGY','Rule the seas and project power. Tough, long-ranged, and versatile.'),
('TXT_KEY_UNIT_FW_RAILGUN_CRUISER_HELP','A powerful Future Era ranged ship with 4 missile slots.'),

-- Bio Cruiser
('TXT_KEY_UNIT_FW_BIO_CRUISER','Bio Cruiser'),
('TXT_KEY_UNIT_FW_BIO_CRUISER_TEXT','Bio-accelerated repair algorithms and hybrid materials grant rapid hull regeneration and higher weapon/armor capacity. Retains conventional sensors and guns while adding survivability inspired by marine life.'),
('TXT_KEY_UNIT_FW_BIO_CRUISER_STRATEGY','Dominate the seas with resilience and firepower.'),
('TXT_KEY_UNIT_FW_BIO_CRUISER_HELP','Ultimate Future Era ranged ship. Self-heals each turn; mounts 4 missiles.'),

-- [[Submarines]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Ballistic Missile Submarine
('TXT_KEY_UNIT_FW_MECHASUB','Ballistic Missile Submarine'),
('TXT_KEY_UNIT_FW_MECHASUB_STRATEGY','Tougher and stronger than attack subs. Invisible to most units; visible when attacking or adjacent; can see other subs. Upgrades from Nuclear Submarine after Cyber-Electronics. Requires [ICON_RES_URANIUM] Uranium.'),
('TXT_KEY_UNIT_FW_MECHASUB_PEDIA','SSBNs deploy submarine-launched ballistic missiles carrying nuclear warheads, forming the most survivable leg of nuclear deterrence thanks to stealth and range. The U.S., Russia, the UK, France, China, and India operate them.'),
('TXT_KEY_UNIT_FW_MECHASUB_HELP','Hidden from all but Destroyers and other Submarines. Carries 2 missiles; excels at striking other naval units. Requires [ICON_RES_URANIUM] Uranium.'),

-- Leviathan (Cyber Sub)
('TXT_KEY_UNIT_FW_CYBERSUB','Leviathan'),
('TXT_KEY_UNIT_FW_CYBERSUB_TEXT','A deep-sea cybernetic predator linking crew, AI, and remote command via neuro-avatar interfaces. Bio-quantum cores and “Spider” sensors execute reflexive attack/evasion even in abyssal conditions.'),
('TXT_KEY_UNIT_FW_CYBERSUB_STRATEGY','A Future Era submarine.'),
('TXT_KEY_UNIT_FW_CYBERSUB_HELP','Hidden from all but Destroyers and Submarines. Carries 2 missiles; specialized for naval strikes.'),

-- [[Carriers]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Aegis Supercarrier
('TXT_KEY_UNIT_FW_SUPERCARRIER','Aegis Supercarrier'),
('TXT_KEY_UNIT_FW_SUPERCARRIER_HELP','Carries up to 10 aircraft. Limited to 2 per civilization.'),
('TXT_KEY_UNIT_FW_SUPERCARRIER_STRATEGY','Transports Fighters, Bombers (not Stealth Bombers), and Atomic Bombs. Cannot attack directly; its air wing is the fleet’s main strike arm. Strong defenses but needs escort from Missile Destroyers and Nuclear Subs. Limited to 2 per civ.'),
('TXT_KEY_UNIT_FW_SUPERCARRIER_TEXT','A nuclear-powered flagship with advanced sensors and ASW capability, projecting power globally with sustained operations and a large, flexible air wing.'),

-- [[Fighters]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Stealth UCAV Squadron
('TXT_KEY_UNIT_FW_DRONE_FIGHTER_2','Stealth UCAV Squadron'),
('TXT_KEY_UNIT_FW_DRONE_FIGHTER_2_TEXT','A manned-unmanned team: a crewed lead fusing sensors and C2 with 2–6 low-observable UCAVs executing recon/EW/decoys/precision strike. Distributed kill-chains, internal bays, and adaptive emissions enable deep penetration and SEAD/DEAD with high survivability.'),
('TXT_KEY_UNIT_FW_DRONE_FIGHTER_2_STRATEGY','A future air unit for air superiority and cooperative engagements.'),
('TXT_KEY_UNIT_FW_DRONE_FIGHTER_2_HELP','Designed to seize air superiority and intercept incoming aircraft.'),

-- Plasma Fighter
('TXT_KEY_UNIT_FW_PLASMA_FIGHTER','Plasma Fighter'),
('TXT_KEY_UNIT_FW_PLASMA_FIGHTER_TEXT','A high-altitude fighter using superconducting plasma propulsion for agile, efficient flight, paired with a superconducting railgun for extreme-range shots within and above the atmosphere.'),
('TXT_KEY_UNIT_FW_PLASMA_FIGHTER_STRATEGY','A plasma-engine fighter transportable only by Nexus and Helicarrier. Strike cities/units while avoiding dense SAMs; defend the carrier group.'),
('TXT_KEY_UNIT_FW_PLASMA_FIGHTER_HELP','A plasma-engine fighter transportable only by Nexus/Helicarrier. Requires Nanomaterials.'),

-- Space Fighter
('TXT_KEY_UNIT_FW_SPACE_FIGHTER','Space Fighter'),
('TXT_KEY_UNIT_FW_SPACE_FIGHTER_TEXT','A space-capable fighter carried by the Nexus or Helicarrier. Smart-material structures, high-energy engines, and defensive shielding enable exo-atmospheric combat and atmospheric interception to protect orbital assets.'),
('TXT_KEY_UNIT_FW_SPACE_FIGHTER_STRATEGY','Spaceborne fighter. Boards Nexus/Helicarrier; extended range and superior combat stats.'),
('TXT_KEY_UNIT_FW_SPACE_FIGHTER_HELP','A starfighter transportable only by Nexus/Helicarrier. Built to protect the Nexus and intercept enemy air.'),

-- [[Bombers]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Suborbital Bomber
('TXT_KEY_UNIT_FW_SUBORBITAL_BOMBER','Suborbital Bomber'),
('TXT_KEY_UNIT_FW_SUBORBITAL_BOMBER_TEXT','To maximize reach and survivability, bombers evolved to skim suborbital altitudes along quasi-ballistic paths—fast through thin air and difficult to intercept.'),
('TXT_KEY_UNIT_FW_SUBORBITAL_BOMBER_STRATEGY','A future long-range air unit.'),
('TXT_KEY_UNIT_FW_SUBORBITAL_BOMBER_HELP','Executes extreme-range strikes against units and cities.'),

-- Plasma Bomber
('TXT_KEY_UNIT_FW_PLASMA_BOMBER','Plasma Bomber'),
('TXT_KEY_UNIT_FW_PLASMA_BOMBER_TEXT','Combines plasma propulsion with superconducting munitions for precise, high-energy strikes from safe altitude, aided by stealth shaping and emissions control.'),
('TXT_KEY_UNIT_FW_PLASMA_BOMBER_STRATEGY','A plasma-engine bomber transportable only by Nexus/Helicarrier. Bypass dense IADS and devastate cities/units.'),
('TXT_KEY_UNIT_FW_PLASMA_BOMBER_HELP','A plasma-engine bomber transportable only by Nexus/Helicarrier. Requires Nanomaterials.'),

-- Space Bomber
('TXT_KEY_UNIT_FW_SPACE_BOMBER','Space Bomber'),
('TXT_KEY_UNIT_FW_SPACE_BOMBER_TEXT','A Nexus/Helicarrier-borne space bomber. Hardened for vacuum operations with heavy payloads and defensive shields; integrates with Nexus command nodes for strategic strike.'),
('TXT_KEY_UNIT_FW_SPACE_BOMBER_STRATEGY','Spaceframe bomber carried by Nexus/Helicarrier with improved intercept evasion.'),
('TXT_KEY_UNIT_FW_SPACE_BOMBER_HELP','A spaceframe bomber transportable only by Nexus/Helicarrier. Announces doom from above to enemy armies and cities.'),

-- [[Special Units]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Mutant
('TXT_KEY_UNIT_FW_MUTANT','Mutant'),
('TXT_KEY_UNIT_FW_MUTANT_TEXT','Early unethical gene trials produced monstrous yet resilient subjects with regeneration; some released virulent agents upon death, causing panic among attackers.'),
('TXT_KEY_UNIT_FW_MUTANT_STRATEGY','Assault infantry that heals on kill each turn.'),
('TXT_KEY_UNIT_FW_MUTANT_HELP','A mobile, resilient unit strong against wounded enemies.'),

-- Bio-Titan
('TXT_KEY_UNIT_FW_HYDRA','Bio-Titan'),
('TXT_KEY_UNIT_FW_HYDRA_TEXT','Gigantic engineered organisms accelerated from paleo-genetic templates and powered by compact reactors, blending immense regeneration with devastating offense—outmuscling exterminator bots at the cost of speed.'),
('TXT_KEY_UNIT_FW_HYDRA_STRATEGY','Future Era melee titan—slower than Exterminator Bots but stronger. Executes a ranged strike before melee.'),
('TXT_KEY_UNIT_FW_HYDRA_HELP','One of the strongest end-game units. Slower yet stronger than exterminator robots; enlarged profile grants extra sight.'),

-- Nanohive
('TXT_KEY_UNIT_FW_NANOHIVE','Nanohive'),
('TXT_KEY_UNIT_FW_NANOHIVE_TEXT','After short-lived nano-swarms proved fragile, autonomous “hives” emerged to carry, replenish, and task assemblers/disassemblers at the front—healing allies and eroding foes at the molecular level.'),
('TXT_KEY_UNIT_FW_NANOHIVE_STRATEGY','A Future Era helicopter-class support unit that heals allies and damages nearby enemies within 2 tiles each turn.'),
('TXT_KEY_UNIT_FW_NANOHIVE_HELP','Heals friendly units and harms enemies within 2 tiles each turn.'),

-- Megahive
('TXT_KEY_UNIT_FW_MEGAHIVE','Megahive'),
('TXT_KEY_UNIT_FW_MEGAHIVE_TEXT','A persistent hovering platform with self-restoration and ranged attack. Crosses any terrain and sustains allies—but cannot capture cities on its own.'),
('TXT_KEY_UNIT_FW_MEGAHIVE_STRATEGY','A hover unit that traverses all terrain. Powerful vs cities but cannot capture.'),
('TXT_KEY_UNIT_FW_MEGAHIVE_HELP','Hovers anywhere, heals nearby allies, and delivers strong ranged attacks.'),

-- Helicarrier
('TXT_KEY_UNIT_FW_HELICARRIER','Helicarrier'),
('TXT_KEY_UNIT_FW_HELICARRIER_TEXT','A hovering carrier-platform enabling flexible air operations in almost any weather and theater. Embarks fighters, helicopters, and UAVs; carries robust sensors and air defenses for mobile C2/ISR.'),
('TXT_KEY_UNIT_FW_HELICARRIER_STRATEGY','A hovering support unit. Limited to 2 per civilization.'),
('TXT_KEY_UNIT_FW_HELICARRIER_HELP','Future support unit that hovers over land; carries up to 6 aircraft. [NEWLINE][NEWLINE][COLOR_YELLOW]Limited to 2 per civilization.[ENDCOLOR]'),

-- Nexus
('TXT_KEY_UNIT_FW_NEXUS','Nexus'),
('TXT_KEY_UNIT_FW_NEXUS_TEXT','An aerospace bastion for colonization and warfighting: fusion power, smart materials, onboard nanohives, and command nodes coordinating railguns, missiles, and a spaceborne wing for autonomous sustainment and defense.'),
('TXT_KEY_UNIT_FW_NEXUS_STRATEGY','A support platform that heals allies while damaging and weakening adjacent enemies each turn. Only one per civ at a time.'),
('TXT_KEY_UNIT_FW_NEXUS_HELP','Future support unit: heals friendly units each turn; damages and debuffs adjacent enemies. Carries up to 10 aircraft. [NEWLINE][NEWLINE][COLOR_YELLOW]Limited to 2 per civilization.[ENDCOLOR]'),

-- Dummy Unit
('TXT_KEY_UNIT_FW_VAULT_RACK','Turret Rack (Dummy)'),
('TXT_KEY_UNIT_FW_VAULT_RACK_TEXT','A stopgap unit to work around missile-tile bugs.'),
('TXT_KEY_UNIT_FW_VAULT_RACK_STRATEGY','After Environmental Arcology, build Missile Silo to store missiles on this unit.'),
('TXT_KEY_UNIT_FW_VAULT_RACK_HELP','Stores up to 3 missiles. If pillaged, the unit is destroyed; repairing the tile restores function. Automatically Fortifies each turn.');

--===========================
-- Promotion
--===========================
--------------------------------------
-- Text
-------------------------------
-- NEW COMBAT TYPE

UPDATE Language_en_US
SET Text = 'Bonus vs Helicopters and Air-Recon Units (150)'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_HELICOPTER';

UPDATE Language_en_US
SET Text = '[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+150%[ENDCOLOR] vs Helicopter and Air-Recon units'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_HELICOPTER_HELP';



INSERT INTO Language_en_US (Tag, Text) VALUES
-- Diplomat
('TXT_KEY_PROMOTION_AUGMENTED','Augmented Diplomacy'),
('TXT_KEY_PROMOTION_AUGMENTED_HELP','When performing diplomatic missions, gain [ICON_INFLUENCE] Influence [COLOR_POSITIVE_TEXT]105[ENDCOLOR]'),

-- Splash / Area damage
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_1','Area Burst I'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_1_HELP','Deals 20/10/5 damage to units within 1/2/3 tiles (from the unit’s tile)'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_2','Area Burst II'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_2_HELP','Deals 30/15/8 damage to units within 1/2/3 tiles (from the unit’s tile)'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_3','Area Burst III'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_3_HELP','Deals 40/20/10 damage to units within 1/2/3 tiles (from the unit’s tile)'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_4','Ground Rupture I'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_4_HELP','Adjacent tiles take +40 additional damage'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_5','Ground Rupture II'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_5_HELP','Adjacent tiles take +50 additional damage'),

-- UFO movement
('TXT_KEY_PROMOTION_FW_MOVE_ALL_TERRAIN','UFO Unit'),
('TXT_KEY_PROMOTION_FW_MOVE_ALL_TERRAIN_HELP','May pass over Mountains; traverses Water tiles without Embarkation; can [COLOR_POSITIVE_TEXT]attack from Ocean tiles[ENDCOLOR]'),

-- Battle network
('TXT_KEY_PROMOTION_FW_NETWORKED','Battle Network'),
('TXT_KEY_PROMOTION_FW_NETWORKED_HELP','[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR] when adjacent to friendly units'),

-- Small Modular Reactor
('TXT_KEY_PROMOTION_FW_NUCLEAR_SMR','Small Modular Reactor'),
('TXT_KEY_PROMOTION_FW_NUCLEAR_SMR_HELP','On death, deals [COLOR_POSITIVE_TEXT]20[ENDCOLOR] damage to adjacent enemy units'),

-- Orbital Drop
('TXT_KEY_PROMOTION_ORBITAL_DROP','Orbital Drop'),
('TXT_KEY_PROMOTION_ORBITAL_DROP_HELP','Can paradrop up to 64 tiles away'),

-- Mutation
('TXT_KEY_PROMOTION_FW_MUTATION','Mutation'),
('TXT_KEY_PROMOTION_FW_MUTATION_HELP','[COLOR_CYAN]Mutagenic Virus[ENDCOLOR]: [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR] vs damaged units'),

-- Hive (Nanohive aura)
('TXT_KEY_PROMOTION_FW_NANOHIVE_PROMOTION','Hive Mind'),
('TXT_KEY_PROMOTION_FW_NANOHIVE_PROMOTION_HELP','Heal friendly units within 2 tiles for [COLOR_POSITIVE_TEXT]10[ENDCOLOR]; deal [COLOR_POSITIVE_TEXT]10[ENDCOLOR] damage to enemy units within 2 tiles'),

-- Nexus command debuff
('TXT_KEY_PROMOTION_FW_NEXUS','Command Network'),
('TXT_KEY_PROMOTION_FW_NEXUS_HELP','Enemies within 2 tiles suffer [ICON_STRENGTH] [COLOR_POSITIVE_TEXT]-20%[ENDCOLOR] Combat Strength'),

-- Mnemosyne Learning
('TXT_KEY_PROMOTION_MNEMOSYNE_EXPERIENCE','Mnemosyne Learning'),
('TXT_KEY_PROMOTION_MNEMOSYNE_EXPERIENCE_HELP','Earn promotions [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR] faster'),

-- Predator (generic)
('TXT_KEY_PROMOTION_FW_PREDATOR','Predatory instinct'),
('TXT_KEY_PROMOTION_FW_PREDATOR_HELP','[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),

-- Skynet Link
('TXT_KEY_PROMOTION_FW_SKYNET_LINK','Skynet Link'),
('TXT_KEY_PROMOTION_FW_SKYNET_LINK_HELP','[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),

-- Space Specialist
('TXT_KEY_PROMOTION_FW_SPACESPECIALIST', 'Space Specialist'),
('TXT_KEY_PROMOTION_FW_SPACESPECIALIST_HELP', '[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),

-- Transgenics (mobility & penalties)
('TXT_KEY_PROMOTION_FW_TRANSGENICS','Transgenics'),
('TXT_KEY_PROMOTION_FW_TRANSGENICS_HELP','Removes attack penalties across Rivers/Water[NEWLINE]Crossing a River costs only [ICON_MOVES] [COLOR_POSITIVE_TEXT]1[ENDCOLOR] Movement[NEWLINE]Ignores Marsh movement penalty'),

-- Auto-Repair
('TXT_KEY_PROMOTION_FW_AUTO_REPAIR','Auto-Repair'),
('TXT_KEY_PROMOTION_FW_AUTO_REPAIR_HELP','In friendly territory: Heal [COLOR_GREEN]+10[ENDCOLOR] HP per turn; [ICON_STRENGTH] [COLOR_GREEN]+5[ENDCOLOR] Combat Strength'),

-- Airborne Assault
('TXT_KEY_PROMOTION_FW_AEROPLEX_DROP','Airborne Assault'),
('TXT_KEY_PROMOTION_FW_AEROPLEX_DROP_HELP','Can paradrop up to [COLOR_POSITIVE_TEXT]42 tiles[ENDCOLOR] away'),

-- Genetic Engineering (choice unlock)
('TXT_KEY_PROMOTION_FW_GENGINEERED','Genetic Engineering'),
('TXT_KEY_PROMOTION_FW_GENGINEERED_HELP','Unlocks Genetic Engineering promotion choices'),

-- Gene Mods
('TXT_KEY_PROMOTION_FW_ADRENAL_GLANDS','Genetic Mod: Adrenal Boost'),
('TXT_KEY_PROMOTION_FW_ADRENAL_GLANDS_HELP','[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR] in rough terrain'),
('TXT_KEY_PROMOTION_FW_ENHANCED_REFLEXES','Genetic Mod: Enhanced Reflexes'),
('TXT_KEY_PROMOTION_FW_ENHANCED_REFLEXES_HELP','[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR] vs ranged units'),
('TXT_KEY_PROMOTION_FW_ENHANCED_VISION','Genetic Mod: Enhanced Vision'),
('TXT_KEY_PROMOTION_FW_ENHANCED_VISION_HELP','Sight [COLOR_POSITIVE_TEXT]+1[ENDCOLOR]'),
('TXT_KEY_PROMOTION_FW_PREDATOR_INSTINCT','Genetic Mod: Predator Instinct'),
('TXT_KEY_PROMOTION_FW_PREDATOR_INSTINCT_HELP','[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR] in Forest/Jungle'),
('TXT_KEY_PROMOTION_FW_ENHANCED_MUSCLES','Genetic Mod: Enhanced Muscles'),
('TXT_KEY_PROMOTION_FW_ENHANCED_MUSCLES_HELP','[ICON_MOVES] Movement [COLOR_POSITIVE_TEXT]+1[ENDCOLOR]'),
('TXT_KEY_PROMOTION_FW_URBAN_WARFARE','Genetic Mod: Urban Warfare'),
('TXT_KEY_PROMOTION_FW_URBAN_WARFARE_HELP','[COLOR_GREEN]When attacking Cities[ENDCOLOR]: [ICON_STRENGTH] [COLOR_POSITIVE_TEXT]+33%[ENDCOLOR][NEWLINE]Damage taken from Cities [COLOR_POSITIVE_TEXT]-33%[ENDCOLOR]'),
('TXT_KEY_PROMOTION_FW_CHAMELEON','Genetic Mod: Photomorphic Camouflage'),
('TXT_KEY_PROMOTION_FW_CHAMELEON_HELP','Invisible (Stealth)'),

-- Biomods (choice unlock)
('TXT_KEY_PROMOTION_FW_BIOMODS','Biomods'),
('TXT_KEY_PROMOTION_FW_BIOMODS_HELP','Unlocks Biomod promotion choices'),
('TXT_KEY_PROMOTION_FW_IMPACT_MOD','Biomod: Impact Mode'),
('TXT_KEY_PROMOTION_FW_IMPACT_MOD_HELP','When the unit [COLOR_GREEN]moves[ENDCOLOR], deal [COLOR_GREEN]5[ENDCOLOR] damage to each newly adjacent enemy unit'),
('TXT_KEY_PROMOTION_FW_BOOST_MOD','Biomod: Boost Mode'),
('TXT_KEY_PROMOTION_FW_BOOST_MOD_HELP','[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),
('TXT_KEY_PROMOTION_FW_BIOREGENERATION_MOD','Biomod: Regeneration Mode'),
('TXT_KEY_PROMOTION_FW_BIOREGENERATION_MOD_HELP','When this unit heals, friendly units on this and adjacent tiles heal [COLOR_POSITIVE_TEXT]+5[ENDCOLOR][NEWLINE]Heal [COLOR_POSITIVE_TEXT]+10[ENDCOLOR] on kill'),
('TXT_KEY_PROMOTION_FW_SYNTHETIC_LUNGS_MOD','Biomod: Synthetic Lungs'),
('TXT_KEY_PROMOTION_FW_SYNTHETIC_LUNGS_MOD_HELP','May cross Mountains; double movement on Hills'),
('TXT_KEY_PROMOTION_FW_REFLEX_MOD','Biomod: Reflex Amplifier'),
('TXT_KEY_PROMOTION_FW_REFLEX_MOD_HELP','[COLOR_POSITIVE_TEXT]+20%[ENDCOLOR] chance to withdraw from melee'),
('TXT_KEY_PROMOTION_FW_VISION_ENHANCEMENT_MOD','Biomod: Vulnerability Highlighting'),
('TXT_KEY_PROMOTION_FW_VISION_ENHANCEMENT_MOD_HELP','[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR] vs damaged units'),
('TXT_KEY_PROMOTION_FW_TOXIN_MOD','Biomod: Toxin Mode'),
('TXT_KEY_PROMOTION_FW_TOXIN_MOD_HELP','On death, deals [COLOR_POSITIVE_TEXT]10[ENDCOLOR] damage to adjacent enemy units'),
('TXT_KEY_PROMOTION_FW_SHOCK_WAVE_SHIELD_MOD','Biomod: Shock-Wave Shield'),
('TXT_KEY_PROMOTION_FW_SHOCK_WAVE_SHIELD_MOD_HELP','While [COLOR_GREEN]Fortified[ENDCOLOR], deal [COLOR_GREEN]10[ENDCOLOR] damage each turn to adjacent enemy units'),

-- Evasion (bombers)
('TXT_KEY_PROMOTION_SUBORBITAL_EVASION','Suborbital Bombing'),
('TXT_KEY_PROMOTION_SUBORBITAL_EVASION_HELP','[COLOR_POSITIVE_TEXT]25%[ENDCOLOR] chance to evade interception'),
('TXT_KEY_PROMOTION_PLASMA_EVASION','Plasma Bombing'),
('TXT_KEY_PROMOTION_PLASMA_EVASION_HELP','Plasma engine thrust grants [COLOR_POSITIVE_TEXT]35%[ENDCOLOR] chance to evade interception'),
('TXT_KEY_PROMOTION_SPACE_EVASION','Orbital Bombing'),
('TXT_KEY_PROMOTION_SPACE_EVASION_HELP','Near-escape-velocity profile grants [COLOR_POSITIVE_TEXT]45%[ENDCOLOR] chance to evade interception'),

-- Supremacy Strain (vs Gunpowder)
('TXT_KEY_FW_PROMOTION_MASTER_RACE', 'Supremacy Strain'),
('TXT_KEY_FW_PROMOTION_MASTER_RACE_HELP', '[COLOR_POSITIVE_TEXT]When fighting Gunpowder units[ENDCOLOR]: [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+30%[ENDCOLOR][NEWLINE][COLOR_NEGATIVE_TEXT]When adjacent to friendly units[ENDCOLOR]: [ICON_STRENGTH] Combat Strength [COLOR_NEGATIVE_TEXT]-15%[ENDCOLOR]'),

-- Apex Invader
('TXT_KEY_PROMOTION_FW_APEXPREDATOR', 'Apex Invader'),
('TXT_KEY_PROMOTION_FW_APEXPREDATOR_HELP', '[COLOR_GREEN]On Open Terrain[ENDCOLOR]: [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR][NEWLINE]Vs [COLOR_GREEN]Damaged Units[ENDCOLOR]: [ICON_STRENGTH] [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),

-- Spaceship (airframe synergy)
('TXT_KEY_PROMOTION_FW_SPACESHIP', 'Spaceship'),
('TXT_KEY_PROMOTION_FW_SPACESHIP_HELP', 'Fighter and Bomber units: [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR]'),

-- Implants
('TXT_KEY_PROMOTION_FW_IMPLANTS', 'Implants'),
('TXT_KEY_PROMOTION_FW_IMPLANTS_HELP', '[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),

-- Orbital Guidance (GPS Assist)
('TXT_KEY_PROMOTION_FW_GPSASSIST', 'Orbital Guidance'),
('TXT_KEY_PROMOTION_FW_GPSASSIST_HELP', '[ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),

-- Advanced Tactics
('TXT_KEY_FW_PROMOTION_ADVANCED_TACTICS', 'Advanced Tactics'),
('TXT_KEY_FW_PROMOTION_ADVANCED_TACTICS_HELP', 'Great Generals and Great Admirals: [ICON_MOVES] Movement [COLOR_POSITIVE_TEXT]+1[ENDCOLOR], Sight [COLOR_POSITIVE_TEXT]+1[ENDCOLOR], Ignore [COLOR_POSITIVE_TEXT]ZOC[ENDCOLOR]'),

-- Worker Implants
('TXT_KEY_FW_PROMOTION_IMPLANTS_WORKER', 'Worker Implants'),
('TXT_KEY_FW_PROMOTION_IMPLANTS_WORKER_HELP', 'Workers and Great People: [ICON_MOVES] Movement [COLOR_POSITIVE_TEXT]+3[ENDCOLOR], Sight [COLOR_POSITIVE_TEXT]+1[ENDCOLOR]'),

-- Neurotoxin (Swarm)
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_0',       'Neurotoxin Injection'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_1',       'Neurotoxin Paralysis'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_0_HELP',  '[COLOR_GREEN]On hit, applies a mark[ENDCOLOR]. Marked units suffer reduced [ICON_MOVES] Movement, max HP lowered to [COLOR_RED]20[ENDCOLOR], and for [COLOR_GREEN]3 turns[ENDCOLOR] can heal only up to [COLOR_RED]10 HP[ENDCOLOR].'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_1_HELP',  'This unit has been [COLOR_GREEN]hit by Neurotoxin[ENDCOLOR]: reduced [ICON_MOVES] Movement; max HP limited to [COLOR_RED]20[ENDCOLOR]; for [COLOR_GREEN]3 turns[ENDCOLOR] can heal only up to [COLOR_RED]10 HP[ENDCOLOR].'),

-- Angelnet blessing
('TXT_KEY_PROMOTION_FW_ANGELNET', 'Blessing of Angelnet'),
('TXT_KEY_PROMOTION_FW_ANGELNET_HELP', 'Within 4 tiles of a city with an [COLOR_CYAN]Angelnet[ENDCOLOR]: [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR]'),

-- Healing Core (robotic/naval sustain)
('TXT_KEY_PROMOTION_FW_HEALING_CORE','Support Node Aegis'),
('TXT_KEY_PROMOTION_FW_HEALING_CORE_HELP','Robotic units and naval units heal an additional [COLOR_GREEN]+10[ENDCOLOR] HP each turn');
