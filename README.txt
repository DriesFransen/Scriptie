Downsample en Split.ipynb
	clips_size_kB(path)
		argumenten
			- path: het pad naar de plek waar de clips staan opgeslagen, bijvoorbeeld Data/nl/clips
		return
			- de grootte van de map waar path naar verwijst in kB

	sort_age_gen_occ(df)
		argumenten
			- df: een dataframe gemaakt van een van de .tsv-files die in de mappen voor de verschillende talen zitten
		return
			- een dictionary waarbij elke combinatie van leeftijd en geslacht mapt naar hoevaak die combinatie voorkomt, 
				bijvoorbeeld { ("twenties", "female"):541 }
			- een lijst met alle combinaties van leeftijd en geslacht in de dataframe, geordend naar hoe vaak die combinatie voorkomt, van laag naar hoog

	downsample_language(path, new_size_kB, extension=".wav", p=False)
		argumenten
			- path: het pad naar de plek waar de taal staat opgeslagen, bijvoorbeeld Data/nl
			- new_size_kB: de grootte die de nieuwe data ongeveer moet hebben in kB
			- extension: de extensie die de clips hebben
			- p: een boolean voor het wel of niet printen van informatie over de stappen die het programma neemt
		return
			- een lijst met alle bestandsnamen die nog in de gedownsamplede taal zitten

	split_train_test_validate(data, weights)
		argumenten
			- data: een lijst met alle bestandsnamen die gesplit moet worden
			- weights: een dict met {"train":train_weight, "test":test_weight, "validate":validate_weight}, of een lijst met weights voor de train, test en validate weights. 
				Als de weights bijvoorbeeld [7, 2, 1] zijn, dan zijn de train, test en validate sets 70%, 20% en 10% van de originele data, respectievelijk.
		return
			- een dictionary met {"train":train_clips, "test":test_clips, "validate":validate_clips}, waarbij de clips lijsten met de bestandsnamen van clips zijn.

	downsample_wrapped(path, new_size_kB, extension=".wav", p=False, destination_name="/general")
		argumenten
			- path: het pad naar de plek waar de taal staat opgeslagen, bijvoorbeeld Data/nl
			- new_size_kB: de grootte die de nieuwe data ongeveer moet hebben in kB
			- extension: de extensie die de clips hebben
			- p: een boolean voor het wel of niet printen van informatie over de stappen die het programma neemt
			- destination name: de naam van de map waarin de gedownsamplede taal moet komen.
		return
			- niks, deze functie voert het downsamplen uit en zet de gedownsamplede bestanden in een nieuwe map

	downsample_split_wrapped(path, new_size_kB, split_weights, extension=".wav", p=False)
		argumenten
			- path: het pad naar de plek waar de taal staat opgeslagen, bijvoorbeeld Data/nl
			- new_size_kB: de grootte die de nieuwe data ongeveer moet hebben in kB
			- split_weights: een dict met {"train":train_weight, "test":test_weight, "validate":validate_weight}, of een lijst met weights voor de train, test en validate weights. 
				Als de weights bijvoorbeeld [7, 2, 1] zijn, dan zijn de train, test en validate sets 70%, 20% en 10% van de originele data, respectievelijk.
			- extension: de extensie die de clips hebben
			- p: een boolean voor het wel of niet printen van informatie over de stappen die het programma neemt
		return
			- niks, deze functie voert het downsamplen uit, splitst daarna de resulterende lijst met bestandsnamen volgens de opgegeven weights, 
				en zet de daaruit voortkomende train, test en validation sets in drie verschillende mappen


low-pass filter and MFCC extraction.ipynb
	get_MFCC_per_folder(path, cutoff=400, order=6, top_db=20)
		argumenten
			-path: het pad naar de plek waar de data is opgeslagen (bijvoorbeeld 'Downsampled/nl/train')
			-cutoff: de upper-bound van de low-pass filter in Hertz. default is 400 Hertz.
			-order: een parameter voor de low-pass filter. default is 6.
			-top_db: Drempelwaarde onder de referentie waarde (vaak het maximum van het audio signaal). Als het verschil tussen een stukje audio en de referentie waarde
				 groter is dan de top_db, dan wordt dat stukje audio aangemerkt als 'stilte' (waarde van nul). default is 20 decibel.
		return
			-een dictionary met het volgende key-value paar: (ID van audio file, MFCC waardes van desbetreffende audio file)

	get_paths_of_language(soure_path, language_folder, sub_folders)
		argumenten
			-source_path: het pad waar alle audio data zit opgeslagen (in dit geval de folder 'Downsampled')
			-language_folder: de folder waar de data van een taal zit opgeslagen (bijvoorbeeld 'nl')
			-sub_folders: de folders die in de language_folder zitten (bijvoorbeeld 'train_wav_clips'). Selecteer hier de relevante sub folders die u wilt gebruiken.
		return
			-een lijst van paden waar audio data zit opgeslagen.
