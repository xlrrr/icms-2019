import 'package:flutter/material.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:icms_bulgaria/CustomWidgets/bullet.dart';

class SessionsMenu extends StatefulWidget {
  @override
  _SessionsMenuState createState() => _SessionsMenuState();
}

class _SessionsMenuState extends State<SessionsMenu> {
  TextEditingController editingController = TextEditingController();



  @override
  void initState() {
    filteredItems.addAll(map);
    super.initState();
  }

  void filterSearchResults(String query) {
    filteredItems.clear();

    if(query.isNotEmpty) {
      var dummyDictData = Map<int, List<String>>();
      map.forEach((key, list) {
        list.forEach((string){
          if(string.toLowerCase().contains(query.toLowerCase()))
          {
            if(dummyDictData[key] == null)
            {
              dummyDictData[key] = List<String>();
            }
            dummyDictData[key].add(string);
          }
        });
      });
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(dummyDictData);
      });
      return;
    } else {
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(map);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/bluebg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height:70,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                  child: new Theme(
                    data: new ThemeData(
                        primaryColor: Colors.white30,
                        primaryColorDark: Colors.white12
                    ),
                    child: TextField(
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      style: TextStyle(
                          color: Colors.white
                      ),
                      controller: editingController,
                      decoration: InputDecoration(
                        labelText: "Search",
                        labelStyle: TextStyle(
                            color: Colors.white
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.white,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.white, width: 2)),
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        EntryItem(data[index]),
                    itemCount: data.length,
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar:  new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/footer.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: new BottomAppBar(
            color: Colors.transparent,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 40,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset("assets/icons/iconlecturewhite.png"),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    Text("Sessions", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                IconButton(
                  icon: Image.asset("assets/icons/iconmail.png"),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUsMenu()),
                    );
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, this.bullet, this.depth, this.itemsIndex, [this.children = const <Entry>[]]);

  final String title;
  final int depth;
  final Bullet bullet;
  final List<Entry> children;
  final int itemsIndex;

  bool isEmpty()
  {
    if(children.isEmpty)
    {
      return filteredItems[itemsIndex] == null || filteredItems[itemsIndex].length == 0;
    }
    else
    {
        bool hasNonEmptyChildren = false;

        this.children.forEach((child){
            if(child.isEmpty() == false)
            {
              hasNonEmptyChildren = true;
            }
        });

        if(hasNonEmptyChildren)
        {
          return false;
        }

        return true;
    }
  }
}

var filteredItems = Map<int, List<String>>();

final Map<int, List<String>> map =
{
  0: <String>[ // Preclinic Oral Session I
    "POS1-1: Aleksandra Starosz – Assessment of vitamin D3 effects on Graves disease orbital fibroblasts.",
    "POS1-2: Alex Tzonev – Evaluation of the antinociceptive activity of melatonin and a newly synthesized indol-based aroylhydrazone derivative bearing furan moiety.",
    "POS1-3: Angeliki Moutafi – Mozart' s music effect over the heart rate variability.",
    "POS1-4: Arman Hovhannisyan – Changes of lipid peroxidation in white rats brain mitochondrial fractions during epilepsy.",
    "POS1-5: Dimo Dimitrov – A systematic classification of the types of synapses observed in the dorsal claustrum.",
    "POS1-6: Dinara Sharipova – A cell model for studying alpha-synuclein interactome in Parkinson’s disease.",
    "POS1-7: Elena Harizanova – Synaptophysin quantification via advanced morphological filtering of widefield epifluorescence images.",
    "POS1-8: Emil Nikolov – The Vascular aging - Psychosocial and Lifestyle Factors.",
    "POS1-9: Emiliya Stoyanova – Antitumor activity of Gastropodan hemocyanins in murine model of colon carcinoma.",
    "POS1-10: Katarzyna Supruniuk – Pyrazole-platinum(II) complexes influence protein glycosylation in cancer cells.",
    "POS1-11: Kinga Szczepaniak – Diagnostic dilemmas with classification of melanocytic lesions – a novel approach to lesions with indeterminate biological behavior.",
    "POS1-12: Lampros Fountoulis – Music and its effects on the human body.",
  ],
  1: <String>[ //Preclinic Oral Session II
    "POS2-1: Lyulyana Gineva – Thermal behavior of brain supernatant and blood plasma for streptozotocin model of dementia in rats.",
    "POS2-2: Marlena Tynecka – NLRP3 inflammasome activation is regulated via BAFF-BAFFR signaling in LPS stimulated monocytes.",
    "POS2-3: Michał Budzik – Metaplastic carcinoma of the breast  – a rare but very aggressive type of breast cancer.",
    "POS2-4: Militsa Telbiyska – Electron microscopic study on the renal alterations in  spontaneously hypertensive rats.",
    "POS2-5: Oleksandr Semaka – The role of ethylmethylhydroxypyridine succinate in the stabilization of magnetite nanoparticles and their anti-anaemic activity.",
    "POS2-6: Oyinlola Bello – Brothers with rare genetic disorders coffin-lowry syndrome & mcadd: case report.",
    "POS2-7: Paoleta Yordanova – Immunohistochemical and semi-quantitative analysis of the expression of nNOS in the left and right ventricle..",
    "POS2-8: Peter Ivanov – Pulse pressure amplification: the implication of age.",
    "POS2-9: Teodor Angelov – Impact of intracerebroventricular injection of kyotorphin on gyrus dentatus in alzheimer’s disease rats’ model.",
    "POS2-10: Velik Lazarov – Ultrastructural aspects of the cytoarchitecture of the cat dorsal claustrum.",
    "POS2-11: Veselina Mihaylova – GABAc receptor contribution to electroretinographic ON and OFF oscillatory potentials.",
    "POS2-12: Yana Yakimova – How can the variations of serotonin receptor gene provoke depression."
  ],
  2: <String>[ //Preclinic Poster Session I
    "PPS1-1: Amalie Svanøe – Higher tumor cell proliferation in breast cancer of the young.",
    "PPS1-2: Angelina Mollova – Heterogeneous E- Cadherine status in synchronous bilateral invasive lobular carcinoma.",
    "PPS1-3: Athanasia - Phaedra Katsiou – Protective effect of kyotorphin against some of the late consequences of intracerebroventricular streptozotocin  model of alzheimer’s disease.",
    "PPS1-4: Desislav Dinev – Poly(sulfobetaine methacrylate)-based materials as potential wound dressings.",
    "PPS1-5: Dimitar Bakalov – Anxiolytic effect of the mesembrenone in rats.",
    "PPS1-6: Elena Gerakova – Case Report: Edwards syndrome with immature submandibular teratoma.",
    "PPS1-7: Eleni Konstantara – Neurovascular unit neural control of vascular permeability: mast cells,as mediators and trigers of neuro-inflammatory process and blood vessels at chemical model of parkinson's deseases(6-OHDA rats).",
    "PPS1-8: Elżbieta Supruniuk – PGC-1α-dependent alterations in lipid profile in L6 myotubes.",
    "PPS1-9: Georgi Bogdanov – Effects of experimental treatment on nociception in a rat model of autism.",
    "PPS1-10: Georgios Dermetzakis – The Menace Of Illicit Drugs.",
    "PPS1-11: Ilona Zareba – Down-regulation of estrogen receptor function facilitate proline dehydrogenase/proline oxidase-dependent apoptosis in MCF-7 breast cancer cells..",
    "PPS1-12: Inaya Mahmoud – Intravital microscopy and ECoG for evaluation of Neurovascular Coupling at the Capillary Level and role of Inward-rectifier potassium channels on endothelial cells and Pericytes, leading to endothelial cell hyperpolarization at 6-OHDA rat model.",
    "PPS1-13: Joanna Tivcheva – Synergic effects of escitalopram and physical activity in neonatal LPS-model of depression in rats.",
    "PPS1-14: Magdalena Misiura – The effect of prolidase on collagen biosynthesis in fibroblast in vitro..",
    "PPS1-15: Maria lazarova – Beneficial effect of snail (helix aspersa) extract on rats with experimental skin wounds. an experimental pilot study.",
    "PPS1-16: Mariia Ezhned – The influence of lipoflavon on proteolytic activity in rats..",
    "PPS1-17: Marija Djordjevic – The impact of neonatal aplication of monosodium gluamate on naso-anal length, length of the tail, tibia mass and tibia length in rats."
  ],
  3: <String>[ //Preclinic Poster Session II
    "PPS2-1: Mario Emilov – Comparing the aggregability of red blood cell from different blood products for transfusion.",
    "PPS2-2: Matei Popnikolov – Absence of musculus palmaris longus in the bulgarian population.",
    "PPS2-3: Milena Duhlinska – Interactions between the adrenergic and the endogenous cannabinoid systems in modulation of restraint stress-induced analgesia.",
    "PPS2-4: Mitko Gospodinov – Novel perspectives on megakaryocytes and adipose tissue in arthritis.",
    "PPS2-5: Mohammad Daoud – Strong Association between Serotonin Transporter 5-HTTVNTR variant and paychactive substance (nicotine) use in Turkish Cypriot Population.",
    "PPS2-6: Mustafa Barzev – Light microscopic study of the anterior cruciate ligament.",
    "PPS2-7: Paul Cotoi – A case of Classical Hodgkin’s Lymphoma with Nodular Sclerosis - importance of immunohistochemistry markers in diagnosis.",
    "PPS2-8: Petra Popovic – C-kit and neurofilament-m immunoreactivity in rat colon with diabetes mellitus.",
    "PPS2-9: Plamena Simeonova – AMPD1, ACTN3, ACE and their Influence on Gestational Diabetes.",
    "PPS2-10: Severina Semkova – New Redoxomic-based Strategy in Cancer – Predictive Medicine.",
    "PPS2-11: Simona Miteva – Ellagic acid delays progression of neurodegeneration in experimental rodent models.",
    "PPS2-12: Sylwia Lewoniewska – AMPK induces apoptosis/autophagy in breast cancer MCF-7 cells through proline dehydrogenase/proline oxidase (PRODH/POX).",
    "PPS2-13: Thi Yen Ly Huynh – POX-dependent inhibition of p53 expression in MCF-7 breast cancer cell.",
    "PPS2-14: Veneta Dimitrova – The effect of hypothermic storage on human red blood cell aggregation.",
    "PPS2-15: Weronika Baszanowska – Metformin inhibits collagen biosynthesis facilitating proline availability for PRODH/POX-dependent apoptosis/autophagy in MCF-7 breast cancer cells.",
    "PPS2-16: Yana Nyankovska – Prospect of using methionine for the biosensors  creation..",
    "PPS2-17: Yana Evtimova – Serotonergic and endogenous cannabinoid systems  interact in modulation of heat stress-induced analgesia.",
    "PPS2-18: Zhenya Stefanova – Learning and memory parameters after experimental treatment of rats in a model of fetal alcohol syndrome."
  ],
  4: <String>[ //Therapy Oral Session I
    "TOS1-1: Adrianna Wasinska – The involvement of humanin in development of Parkinsons disease.",
    "TOS1-2: Alina Ivaniuk – Clinical predictors of reaching disability milestones in patients with multiple sclerosis.",
    "TOS1-3: Alina Kryveshko – Association between non-alcoholic fatty liver disease and cardiovascular diseases.",
    "TOS1-4: Amirkavian Moaveni – Effects of serum autologous therapy in patients with idiopathic chronic urticaria.",
    "TOS1-5: Anamaria Jugariu – Ultrasonography in Sarcopenia: Upper vs Lower Limb – A Pilot Study.",
    "TOS1-6: Anete Jekabsone – Tear film feature marker changes in patients receiving intravitreal injections.",
    "TOS1-7: Antonina Gerganova – Dynamic of volumetric BMD at proximal femur during menopausal transition.",
    "TOS1-8: Arnold Ráduly – Outpatient management of patients with advanced heart failure in Debrecen, Hungary.",
    "TOS1-9: Asiia Miasoutova – Comparative treatment with different progesterones in women with recurrent miscarriage.",
    "TOS1-10: Cristina Mazaroaie – One year mortality in patients with acute pulmonary embolism.",
    "TOS1-11: Denitsa Tsanova – Metabolic disorders in young adults - an exception or a trend? A clinical case."
  ],
  5: <String>[ //Therapy Oral Session II
    "TOS2-1: Elton Olluri – Early seizures after ischemic and hemorrhagic stroke.",
    "TOS2-2: Georgia-Antonia Kasioni – Adhesive capsulitis as first clinical presentation of psoriasic arthritis..",
    "TOS2-3: Hamed Ibrhem – Rett Syndrome.",
    "TOS2-4: Jehona Ibrahimi – Pre-stroke statin use was associated with lower risk of in-hospital death.",
    "TOS2-5: Luxmi Chand – Risk factors of hypertension in young population.",
    "TOS2-6: Maria Dinkova – RSV-infection in early childhood – a challenge for pediatricians.",
    "TOS2-7: Mariam Ghazaryan – Use of silicone-hydrogel contact lenses as a treatment of the patients with keratoconus after cross-linking procedure.",
    "TOS2-8: Myriam Reisch – Treatment change to relieving psychological and physical distress during High-Dose-Rate Brachytherapy for Cervical Cancer.",
    "TOS2-9: Natalija Kostadinova – Complex physical access in a patient with cervical discus herniation.",
    "TOS2-10: Navid Tomlinson – Autoimmune related Nonalcoholic Steatohepatitis in 19 year-old male.",
    "TOS2-11: Olaf Chmura – Relevance of microparticles in blood of patients with endometrial cancer."
  ],
  6: <String>[ //Therapy Oral Session III
    "TOS3-1: Plamena Todorova – Stone analysis and 24h urine evaluation in patients with urolithiasis.",
    "TOS3-2: Polina Tsenkova – Subfertility and PCOS - a case report on the effect of metformin on the fecundity in patient with metabolic syndrome and PCOS..",
    "TOS3-3: Polina Tsarkova – A case of congenital generalized lipodystrophy (Berardinelli-Seip syndrome).",
    "TOS3-4: Răzvan Budeanu – Inter-variability of sarcopenic patients ultrasound investigation – a pilot study.",
    "TOS3-5: Simona Despotovska – Primary cardiac hemangioendothelioma incidentally discovered during pregnancy: a case report.",
    "TOS3-6: Sorubaan Baskaran – First Presentation of Diabetic Ketoacidosis (DKA) in a patient with Achondroplasia.",
    "TOS3-7: Suzan Abdelgafar – Hide and Seek with Erythrocytes.",
    "TOS3-8: Svitlana Borysenko – Wernicke encephalopathy in a pregnant woman.",
    "TOS3-9: Victoria Tencheva – Case of Malignant Peripheral Nerve Sheath Tumor in Neurofibromatosis.",
    "TOS3-10: Yusr Yasin – National Pompe’s disease screening program..",
    "TOS3-11: Zulvina Faozanudin – ER and PR expression are correlated with platelet-lymphocyte ratio in breast cancer.",
    "TOS3-12: Åsta Sulen -  Effectiveness of sulfonylurea treatment in children with KCNJ11 neonatal diabetes."
  ],
  7: <String>[ //Therapy Poster Session I
    "TPS1-1: Alexander Turchinets – Pharmacoresistant epilepsy in 2.5 year old child with mitochondrial complex I deficiency, nuclear type 12..",
    "TPS1-2: Blagica Dzidrova – Therapeutic approach in a patient with musculoskeletal manifestations of lupus.",
    "TPS1-3: Christos Kakkou – Dermatomyositis in a patient with leg amputation due to severe peripheral arterial disease.",
    "TPS1-4: Deborah Fasunloye – Affective Disorders.",
    "TPS1-5: Denis Shakir – A differential diagnosis between transthyretin-related familial amyloid polyneuropathy and toxic polyneuropathy.",
    "TPS1-6: Djordje Marinkovic – Agmatine protective effects in neuroinflammation are medaited by BDNF.",
    "TPS1-7: Elena Krsteva – Therapeutic approach in a patient with spinal disc herniation.",
    "TPS1-8: Elena Pesheva – Esophageal Stricture Due To Dissemination Of Breast Cancer.",
    "TPS1-9: Elina Tsvetanova – Pilot studies on antioxidant activity of newly synthesized memantine’s derivatives with expected effects on Alzheimer’s type dementia.",
    "TPS1-10: Gabriel Zanfir – Gorlin’s syndrome. Histological aspects revisited."
  ],
  8: <String>[ //Therapy Poster Session II
    "TPS2-1: Gabriela Panayotova – Clinical case of early diagnosed colorectal adenocarcinoma.",
    "TPS2-2: Isidora Jankovic – Prevalence of pulmonary embolism in postoperative patients on CTPA.",
    "TPS2-3: Ivana Rambabova – The benefits of kinesitherapy during the period of pregnancy.",
    "TPS2-4: Jan Koper – A novel TAZ gene mutation in family with Barth Syndrome.",
    "TPS2-5: Jerzy Król – Effectivness of levetiracetam in treating  epileptic patients.",
    "TPS2-6: Jovan Ilic – Characteristics of spontaneous subarachnoid haemorrhage without headache in a clinical presentation.",
    "TPS2-7: Kristin Karadjova – The ralation between cardiovascular diseases and celiac disease.",
    "TPS2-8: Magdalena Bliznakova – Choroid Plexus Papilloma in an infant presenting with epileptic seizures.",
    "TPS2-9: Nikola Neshev – Supraventricular tachycardia in the context of congenital cardiomyopathy.",
    "TPS2-10: Nikolaos Sevdalis – Cause of admission of Diabetes Mellitus type 2 patients in an Internal Medicine clinic: One-year study."
  ],
  9: <String>[ //Therapy Poster Session III
    "TPS3-1: Pantelina Kalakouti – Diabetic Ketoacidosis – A potential life-threatening condition: A Case Report.",
    "TPS3-2: Petar Popov	False – Positive Test Result for Lyme Disease in Systemic Lupus.",
    "TPS3-3: Petya Racheva – Rare Case of Pituitary Adenoma with Co-Secretion of GH, PRL and ACTH.",
    "TPS3-4: Stamatia Perifanou-Sotiri – Sleep disturbances and cancer.",
    "TPS3-5: Stefani Boyadzhieva – From radicular syndromes due to intervertebral disk herniation to amyotrophic lateral sclerosis.",
    "TPS3-6: Tamara Janeva – Therapeutic approach in a patient after tibial shaft fracture.",
    "TPS3-7: Teodora Yanakieva – Serum thyroid autoantibodies and development of Hashimoto encephalopathy as a complication in patients with Hashimoto thyroiditis.",
    "TPS3-8: Vesela Todorova – The Challenge – Patient with Embolic Stroke of Unknown Source (ESUS).",
    "TPS3-9: Vlasios Spanakis – Idiopathic pulmonary hypertension: a case report.",
    "TPS3-10: Yana Mihaylova – Streptococcus gallolyticus subspecies pasteurianus endocarditis with concomitant colon cancer."
  ],
  10: <String>[ //Surgery Oral Session I
    "SOS1-1: Aista Subba – Thoracic Wall Hydatid Cysts: Rare Type of Recurrent Echinococcosis Disease.",
    "SOS1-2: Andrijana Pasinechka – Sentinel lymph node localization method in malignant melanoma – comparison between blue dye, planar, SPECT and SPECT/CT technique.",
    "SOS1-3: Bilyana Mihova – Haemothorax as a rare complication of a pulmonary sequestration.",
    "SOS1-4: Elina Daitey – Trichobezoar with an Absence of Psychosocial Stressors.",
    "SOS1-5: Jenny Choi – Mesenteric Thrombosis an analyses on the causes and management of complications.",
    "SOS1-6: Julide Kasaboglu – Malignant keratinized sinonasal carcinoma originated from  inverted papilloma.",
    "SOS1-7: Klaudia Machnicka – Surgical approach for treatment of nutcracker syndrome.",
    "SOS1-8: Maria Garalova – Anastomotic leakage in gastrointestinal surgery."
  ],
  11: <String>[ //Surgery Oral Session II
    "SOS2-1: Nadezhda Stoyanova – Diabetic macular edema treatment with intravitreal application of anti-vegfs.",
    "SOS2-2: Nikolai Kalvachev – Concomitant surgery for treatment of a ventricular aneurysm and dysrhythmia.",
    "SOS2-3: Simeon Lichev – Metastases of hepatocellular carcinoma to the heart – a casereport.",
    "SOS2-4: Stanimir Atsev – Complicated AVM in 10 year old child - a case report.",
    "SOS2-5: Szymon Urban – Modern treatment of degenerative tears of the meniscus - meta-analysis.",
    "SOS2-6: Szymon Bień – Results of CRMO treatment with pamidronate and serum parameters fluctuations.",
    "SOS2-7: Timur Kyashif – Minimally invasive direct coronary artery bypass - a keyhole to the heart.",
    "SOS2-8: Vivaan Dutt – Oesophageal Cancer in a 14 year old Male - A Success Story."
  ],
  12: <String>[ //Surgery Poster Session I
    "SPS1-1: Anna Ponomareva – The impact of modern hemostasis methods on the ovarian reserve.",
    "SPS1-2: Elena Sadovnikova – Individual approach to the choice of the optimal treatment technique small ovarian endometriosis.",
    "SPS1-3: Irena Mircheva – The eight wonder of abdominal surgery.",
    "SPS1-4: Kiril Surchev – Epidemiology and outcomes of tarsometatarsal fracture dislocations.",
    "SPS1-5: Leyla Chabieva – Endometrial infertility factor in patients with ovarian endometriosis.",
    "SPS1-6: Marina Cozma – Establishing the proper approach to an effective surgical treatment for meningioma.",
    "SPS1-7: Mihai-Stelian Moreanu – Rare case of tubo-ovarian abscess and pelvic tumor due to actinomyces israeli infection in a 41-year-old female.",
    "SPS1-8: Renata-Claudia Dragan – Bankart repair applied to habitual shoulder dislocation.",
    "SPS1-9: Stefan Mihaylov – Corosive injury to the esophagus caused by button battery Ingestion in children.",
    "SPS1-10: Sunniva Leer-Salvesen – Does preoperative delay affect mortality for hip fracture patients?.",
    "SPS1-11: Tamara Curea – ACL reconstruction using the Semi-T arthroscopic method.",
    "SPS1-12: Velislav Pavlov – Operative approach to spinal schwannomatosis.",
    "SPS1-13: Violeta Nedialkova – Case of an uncommon injury of the index finger."
  ],
  13: <String>[ //Public Health Oral Session I
    "PHOS1-1: Ainkareswar Kolappa Pillai – Sleep deprivation among Indian and Ukrainian medical students.",
    "PHOS1-2: Alexandra Manti – Health care associated infections- an actual medical problem.",
    "PHOS1-3: Anna Płotek – Do patients with cardiovascular disease follow the guidelines?.",
    "PHOS1-4: Athina- Maria Kalaitzi – Health care associated infections - an actual medical problem.",
    "PHOS1-5: Ebenezer Frimpong – Tswana traditional health practitioners perspectives on the management of diabetes and hypertension:a qualitatitive study using focus group discussions..",
    "PHOS1-6: Eliana Boyadzhieva – Association between multiple sclerosis and epilepsy: a case report.",
    "PHOS1-7: Fjola Hyseni – Coffee, smoking and physical activity's effect on  BMI and depression.",
    "PHOS1-8: Kristina Asanovic – Parental knowledge, attitudes and behavior to children vaccination in Serbia.",
    "PHOS1-9: Marina Bugarski – The frequency of human parvovirus b19 infections in vojvodina.",
    "PHOS1-10: Mehmajeet Pannu – Fair distribution of Malaria Prophylaxis in children <5 years in Malawi.",
    "PHOS1-11: Mihailo Svetozarević – Use of non-steroidal anti-inflammatory drugs among students – a cross sectional study at faculty of medicine and electrical engineering in nis.",
    "PHOS1-12: Olha Marushchak – Development of the web-service model for the evidence-based pharmaceutical care support.",
    "PHOS1-13:Oshin Behl – The Effects of Font Style and Size on Memory in Middle School Children.",
    "PHOS1-14: Tea Alexandrova – Patterns in the consumption of energy drinks in children and adolescents in bulgaria."
  ],
  14: <String>[ //Public Health Poster Session I
    "PHPS1-1: Aishat Oladipo – Knowledge, Attitude and Risk Factors of HepatitisB among Waste Scavengers.",
    "PHPS1-2: Antigoni Kolisiati – Small vessel disease with multi-organ involvement in a child.",
    "PHPS1-3: Ariette Andalón – Childhood obesity: risk factor for Metabolic Syndrome.",
    "PHPS1-4: Dimitar Marinov – Patients’ attitude to medical abortion in Bulgaria.",
    "PHPS1-5: Emanuil Manasiev – Specific factors for personal advancement and the link to the public health.",
    "PHPS1-6: Krassimira Zaykova – A study of some perceptions and knowledge of alchohol usage during pregnancy in bulgaria.",
    "PHPS1-7: Krzysztof Kiper - The 5HT2A gene polymorphism found associated with alcoholism, depression and suicide attempts..",
    "PHPS1-8: Martin Mangelov – Medicinal cannabis: policies and practices in some eu countries.",
    "PHPS1-9: Nikolaos Christos Xifaras – Integration of standalone comprehensive information systems in clinical environments.",
    "PHPS1-10: Rodrigo Cerqueda Audirac – IgM antibodies and maternal age: risk factors for patent ductus arteriosus in congenital rubella.",
    "PHPS1-11: Simoneta Ivanova – Age and gender structure of death from accidental hypothermia in Northern Bulgaria.",
    "PHPS1-12: Stefka Krumova – Molecular Biological Study of the Circulating Measles Virus in Bulgaria, 2019.",
    "PHPS1-13: Theodora Delaporta – Acute Bronchitis.",
    "PHPS1-14: Tsvetelina Stefanova – Analysis of radiopharmaceuticals adverse drug reaction."
  ],
};

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Oral Sessions',
    Bullet(),
    0,-1,
    <Entry>[
      Entry(
        'Preclinic',
        Bullet(shape:BoxShape.circle, useLogoInstead: false),
        1, -1,
        <Entry>[
          Entry('Session I', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2,0),
          Entry('Session II', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2,1)
        ],
      ),
      Entry('Therapy',Bullet(shape:BoxShape.circle, useLogoInstead: false),1,-1,
          <Entry>[
            Entry('Session I', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 4),
            Entry('Session II', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 5),
            Entry('Session III', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 6),
          ]),
      Entry('Surgery', Bullet(shape:BoxShape.circle, useLogoInstead: false),1,-1,
          <Entry>[
            Entry('Session I', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 10),
            Entry('Session II', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 11)
          ]),
      Entry('Public Health', Bullet(shape:BoxShape.circle, useLogoInstead: false),1, 13)
    ],
  ),
  Entry(
    'Poster Sessions',
    Bullet(),
    0,-1,
    <Entry>[
      Entry('Preclinic', Bullet(shape:BoxShape.circle, useLogoInstead: false),1 ,-1,
          <Entry>[
            Entry('Session I', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 2),
            Entry('Session II', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 3),
          ]),
      Entry('Therapy',Bullet(shape:BoxShape.circle, useLogoInstead: false),1,-1,
          <Entry>[
            Entry('Session I', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2,7),
            Entry('Session II', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 8),
            Entry('Session III', Bullet(shape:BoxShape.rectangle, useLogoInstead: false),2, 9),
          ]),
      Entry('Surgery', Bullet(shape:BoxShape.circle, useLogoInstead: false),1, 12),
      Entry('Public Health', Bullet(shape:BoxShape.circle, useLogoInstead: false),1, 14)
    ],
  )
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if(root.isEmpty())
    {
      return Container();
    }
    if (root.children.isEmpty) return Card(
      child: ExpansionTile(
        leading: Container(child: root.bullet, padding: EdgeInsets.only(left: (root.depth * 30.0))),
        key: PageStorageKey<Entry>(root),
        title: Text(root.title, style: TextStyle(color: Colors.black45)),
        children: <Widget>[
          Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(child: Text(root.title, style: TextStyle(color: Colors.black, height: 2, fontSize: 25), textAlign: TextAlign.center))
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(filteredItems[root.itemsIndex].join('\n\n'), style: TextStyle(color: Colors.black, height: 2, fontSize: 15)),
                  )
                ],
              )
          )
        ],
      ),
    );

    return Card(
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        leading: Container(child: root.bullet, padding: EdgeInsets.only(left: (root.depth * 30.0))),
        title: Text(root.title, style: TextStyle(color: Colors.black45)),
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
