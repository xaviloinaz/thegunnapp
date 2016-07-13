//
//  StaffTableViewController.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 6/19/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import UIKit

class StaffTableViewController: UITableViewController {

    
    var staffs = [Staff]()
    
//    var staffsInfo = [Staff]()
    
    var stringOfStaffs = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.barTintColor = UIColor.redColor()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        loadStaffList()
        
    }
    
    
    
    func loadStaffList() {
        
        stringOfStaffs =
        
        "Allie Ackard #Teacher #English #354-8238 #aackard@pausd.org # #Laila Adle #Vision Specialist #Special Education #354-8223 #ladle@pausd.org # #Steve Ames #Instructional Supervisor, Teacher #Physical Education #354-8266 #sames@pausd.org # #Amy Anderson #Teacher #Physical Education #354-8215 #amanderson@pausd.org # #Adriana Aro #Teacher #Special Education #354-8230 #aaro@pausd.org # #Arlena Arteaga #Teacher #Social Studies #354-8237 #aarteaga@pausd.org # #Timothy Aston #Teacher #Science #354-8246 #taston@pausd.org # #Jack Ballard #Assistant Principal #Administration #354-8200, x6885 #jballard@pausd.org # #Neil Barana #Custodian #Custodial #354-8205 #nbarana@pausd.org # #Ana Barrios #Teacher #World Languages #354-8241 #abarrios@pausd.org # #Michael Bautista #Teacher #Mathematics #354-8247 #mbautista@pausd.org #https://sites.google.com/a/pausd.org/bautistamath/ #Chris Bell #Teacher, Technology Coordinator #Technology, Career Technical Education #354-8247 #cbell@pausd.org #https://sites.google.com/a/pausd.org/mr-bells-courses/home #Gretchen Berg #Aide #Special Education #354-8230 #gberg@pausd.org # #Kristy Blackburn #Instructional Supervisor, Teacher #English #354-8238 #kblackburn@pausd.org # #Cris Boswell #Aide #Special Education #354-8230 #cboswell@pausd.org # #Don Bratton #Custodian #Custodial #354-8205 #dbratton@pausd.org # #Don Briggs #Teacher #Physical Education #354-8266 #dbriggs@pausd.org # #Justin Brown #Teacher #English #354-8238 #jdbrown@pausd.org # #John Bulan #Tech Support #Technology #849-7902 #jbulan@pausd.org # #Dean Bunderson #Theatre Manager #Spangenberg #444-7127 #dbunderson@pausd.org #http://www.spangenbergtheatre.org/ #Mary Cabanski #SpEd Aide #Special Education#354-8230 #mcabanski@pausd.org # #Mike Camicia #Teacher #Career Technical Education #354-8255 #mcamicia@pausd.org #http://www.gunnautotech.com/ #Courtney Carlomagno #Teacher #Special Education #354-8262 #ccarlomagno@pausd.org # #Olga Celis #Academic Technology #Technology #354-8200, x5308 #ocelis@pausd.org # #Goldie Chan #Counselor #Guidance #354-8208 #gchan@pausd.org # #Dr. Frank Chen #Physician #Athletics #(650) 853-2943 # # #Melissa Clark #Psychologist #Psychologist #354-8216 #mclark@pausd.org # #Warren Collier #Teacher #Social Studies #354-8237 #wcollier@pausd.org # #Myesha Compton #Counselor #Guidance #354-8207 #mcompton@pausd.org # #Rachel Congress #Teacher #Mathematics #354-8247 #rcongress@pausd.org # #Robert Cormia #Teacher, Nanotech #Career Technical Education #354-8200 #rcormia@pausd.org # #Carol Cornett #Campus Supervisor #Campus Supervisor #354-8200 #pcornett@pausd.org # #Edward Corpuz #Teacher #Career Technical Education #849-7905 #ecorpuz@pausd.org # #Grace Dadzie #Aide #Special Education #354-8230 #gdadzie@pausd.org # #Edwin De Guzman #Custodian #Support Staff #354-8205 #edeguzman@pausd.org # #Dave Deggeller #Instructional Supervisor, Teacher #Mathematics #354-8247 #ddeggeller@pausd.org #https://sites.google.com/a/pausd.org/deggellermath2/ #Karin Delgadillo #Campus Supervisor #Support Staff #354-8288 #kdelgadillo@pausd.org # #Narinder Dhillon #Aide #Special Programs #849-7962 #ndhillon@pausd.org # #Rachel Dion #Teacher #Mathematics #354-8247 #rdion@pausd.org # #Tracy Douglas #Registrar #Guidance #354-8284 #tdouglas@pausd.org # #Anne Dumontier #Teacher #World Languages #354-8241 #adumontier@pausd.org #http://www.gunnfrench.org/ #Bill Dunbar #Teacher #Science #354-8247 #bdunbar@pausd.org #https://sites.google.com/a/pausd.org/dunbar-physics/home #Paul Dunlap #Teacher #English #354-8238 #pdunlap@pausd.org # #Marie Durquet #Teacher #Visual and Performing Arts #354-7903 #mdurquet@pausd.org # #Martha Elderon #Secretary to the Principal #Support Staff #354-8288 #melderon@pausd.org # #Scott Elfving #Teacher #Social Studies #354-8237 #selfving@pausd.org # #Ellen Feigenbaum #Teacher #English #354-8238 #efeigenbaum@pausd.org # #Darlene Feldstein #Instructional Technology #Technology #849-7902 #dfeldstein@pausd.org # #Cristina Florea #Teacher #Mathematics #354-8247 #ccismas@pausd.org #http://ccismas.wix.com/gunn-2015-2016 #Robin Francesconi #Guidance Technician Asst #Guidance #354-8212 #rfrancesconi@pausd.org # #Megan Garcia #Asst. Librarian #Support Staff #354-8252 #mgarcia@pausd.org # #Gabriela Garger #Teacher #World Languages #354-8241 #ggarger@pausd.org #http://www.gargergunn.org/ #Daljeet Gill #Librarian #Library #354-8252 #dgill@pausd.org # #Diane Gleason #Teacher #Mathematics #354-8247 #dgleason@pausd.org # #Mark Gleason #Teacher #Visual and Performing Arts #849-7906 #mgleason@pausd.org #https://sites.google.com/a/pausd.org/mark-gleason-gunn/ #Lynn Glover #Department Secretary #English #354-8247 #lglover@pausd.org # #Melanie Gomez #Cafeteria Supervisor #Food Services #354-8233 #mgomez@pausd.org # #Gordon Goodspeed #Custodian #Custodial #354-8205 #ggoodspeed@pausd.org # #Kristina Granlund #Teacher #Career Technical Education #354-8254 #kgranlund@pausd.org # #Deborah Grant #Health Tech Nurse #Health Office #354-8211 #dgrant@pausd.org # #Patricia Guevara #Teacher #Special Education #354-8230 #pguevara@pausd.org # #Meri Gyves #Teacher/Coordinator Work Experience #Guidance #354-8221 #mgyves@pausd.org # #Ronen Habib #Teacher #Social Studies #354-8237 #rhabib@pausd.org #https://sites.google.com/site/mrhabibssite/ #Alice Hahn #Aide #Special Education #354-8218 #ahahn@pausd.org # #Daniel Hahn #Teacher #Mathematics #354-8247 #dhahn@pausd.org #https://sites.google.com/site/mathwithmrhahn2014/?pli=1 #Lisa Hall #Teacher, Director of Student Activities #English #354-8228 #lhall@pausd.org #https://sites.google.com/a/pausd.org/lhall/ #Nigel Hansen #Custodian #Custodial #354-8205 #nhansen@pausd.org # #Yukiko Hara #Teacher #World Languages #354-8241 #yhara@pausd.org # #Rene Hart #Site Council Coordinator #Site Council #849-7932 #rhart@pausd.org # #John Hebert #Teacher #Social Studies #354-8237 #jhebert@pausd.org # #Kerstin Helbing #Teacher/Coordinator #English Language Learners #354-8241 #khelbing@pausd.org #https://sites.google.com/a/pausd.org/ell/ #Susan Henderson #Aide #Special Education #849-7953 #shenderson@pausd.org # #Luciano Hernandez #Custodian - Supervisor #Custodial #354-8205 #lhernandez@pausd.org # #Mark Hernandez #Teacher #Social Studies #354-8237 #mhernandez@pausd.org # #Dr. Denise Herrmann #Principal #Administration #354-8200 #dherrmann@pausd.org # #Norma Hesterman #Volunteer Coordinator #Support Staff #354-8234 #nhesterman@pausd.org # #Jessica Hexsel #Teacher #Mathematics #849-7930 #jhexsel@pausd.org # #Yukie Hikida #Teacher #World Languages #354-8241 #yhikida@pausd.org #https://sites.google.com/a/pausd.org/nihongo/ #Hindi Hipp #Budget Secretary #Support Staff #354-8274 #hhipp@pausd.org # #Shaina Holdener #Teacher #English #354-8238 #sholdener@pausd.org # #Patricia Holmes #Teacher #Social Studies #849-7951 #pholmes@pausd.org # #Chris Horpel #Instructional Supervisor, Teacher #Physical Education #354-8266 #chorpel@pausd.org # #Joanna Hubenthal #Teacher #Special Education #354-8262 #jhubenthal@pausd.org # #Keith Hunter #Teacher #Visual and Performing Arts #354-8264 #kphillips@pausd.org # #Diane Ichikawa #Teacher #English #354-8238 #dichikawa@pausd.org #https://www.sites.google.com/site/dianeichikawa/ #Marc Igler #Teacher #English #354-8238 #migler@pausd.org #https://sites.google.com/a/pausd.org/mr-igler-s-web-site/ #Curt Johansen #Athletic Director #Athletics #354-8257 #cjohansen@pausd.org # #Derek Johanson #Counselor #Guidance #849-7935 #djohanson@pausd.org # #Chris Johnson #Teacher #Social Studies #354-8237 #cjohnson@pausd.org # #Bridget Johnson #Facilities Secretary #Support Staff #(650) 354-8280 #bjohnson@pausd.org # #Matt Johnson #Boys Water Polo Coach #Athletics # #johnson.matt650@gmail.com # #Chris Karas #Teacher #Mathematics #354-8247 #ckaras@pausd.org # #Tara Keith #Assistant Principal, Student Services & Counseling #Administration #354-8227 #tkeith@pausd.org # #Steve Kelly #Custodian - Supervisor #Custodial #354-8205 #skelly@pausd.org # #Tony Kelly #Football Coach # # #akelly@pausd.org # #Jordan King #Teacher #Visual and Performing Arts #849-7948 #jking@pausd.org # #Arthur Kinyanjui #Teacher #Social Studies #354-8237 #akinyanjui@pausd.org # #Linda Kirsch #College & Career Counselor #College & Career #354-8204 #lkirsch@pausd.org # #Terence Kitada #Teacher #English #354-8238 #tkitada@pausd.org # #Kim Knaack #SAC clerk #SAC #354-8229 #kknaack@pausd.org # #Jacintha Kompella #Teacher #Science #354-8246 #jkompella@pausd.org # #Leslie Kousnetz #SAC clerk #SAC #354-8229 #lkousnetz@pausd.org # #Danielle Kovacich #Teacher #English #354-8238 #dkovacich@pausd.org # #Leighton Lang #College & Career Coordinator #College & Career #354-8219 #llang@pausd.org # #Eric Ledgerwood #Teacher #Science #354-8246 #eledgerwood@pausd.org #https://sites.google.com/a/pausd.org/ledgerwood-ap-environmental-science/ #Michelle Lee #Mental Health Therapist/AC #Special Education #354-8200, x1498 #mlee@pausd.org # #Jena Lee #Teacher #Science #354-8246 #jlee@pausd.org # #Teri Lee #Teacher #Special Education #354-8230 #tlee@pausd.org # #David Leftwich #Counselor #Guidance #354-8225 #dleftwich # #Kira Levina #Aide #English Language Learners #849-7922 #klevina@pausd.org # #Sandra Lewis #Teacher #Visual and Performing Arts #354-8264 #slewis@pausd.org #http://www.gunnmusic.org/ #Jessy (Xiaojie) Li #Teacher #World Languages #354-8241 #xli@pausd.org # #Curtis Liang #Asst. Athletic Director #Athletics #354-8259 #cliang@pausd.org # #Bill Liberatore #Teacher #Visual and Performing Arts #354-8287 #bliberatore@pausd.org #http://www.gunnchoir.org/ #Devin Licon #Technical Support Specialist #Technology #3548200 Ext. 6405 #dlicon@pausd.org # #Dawna Linsdell #Teacher #Social Studies #354-8237 #dlinsdell@pausd.org # #Laura Lizundia #Teacher #World Languages #354-8241 #llizundia@pausd.org # #Kristen Lo #Teacher #Visual and Performing Arts #354-8258 #klo@pausd.org # #Katrina Lortie #Attendance Clerk #Support Staff #354-8210 #klortie@pausd.org # #Marcel Losier #Teacher #World Languages #354-8241 #mlosier@pausd.org #http://www.gunnfrench.org/ #Krissy Ludemann #Department Secretary #World Languages #354-8241 #kludemann@pausd.org # #Phil Lyons #Teacher #Social Studies #354-8237 #plyons@pausd.org #http://mrlyons.net/ #Armando Macias #Custodian #Support Staff #354-8205 #amacias@pausd.org # #Alec MacLean #Teacher #Science #354-8246 #amaclean@pausd.org #https://sites.google.com/a/pausd.org/mr-maclean---science/ #Sophie Magid-Gutkin #Aide #Special Education #354-8250 #smagidgutkin@pausd.org # #Lisa Mahpour #Food Services #Food Services #354-8233 #lmahpour@pausd.org # #Carole Main #Secretary #Support Staff #354-8254 #cmain@pausd.org # #Jeanne-Claudius Martin #Science Prep Aide #Special Programs, Science #354-8246 #jmartin@pausd.org # #Rolando Martinez #Technology asst. #Technology #849-77902 #rmartinez@pausd.org # #Liz Matchett #Instructional Supervisor, Teacher #World Languages #354-8241 #lmatchett@pausd.org # #Charles Mayman #Robotics Aide #Career Technical Education #354-8254 #cmayman@pausd.org # #Claire McCole #Food Services Manager #Food Services #354-8233 #cmccole@pausd.org # #Matt McGinn #Teacher #Physical Education #354-8266 #mmcginn@pausd.org # #Norma Medina #Teacher #World Languages #354-8241 #nmedina@pausd.org # #Heather Mellows #Teacher #Science #354-8246 #hmellows@pausd.org # #Nicole Menache #Teacher #English #354-8238 #nmenache@pausd.org # #Stephanie Mendoza #Translator #Special Programs #354-8231 #smendoza@pausd.org # #Angela Merchant #Teacher #Science, Career Technical Education #354-8246 #amerchant@pausd.org #https://sites.google.com/site/msmerchantsbioacclass/home #Deanna Messinger #Teacher #Visual and Performing Arts #354-8256 #dmessinger@pausd.org #https://sites.google.com/site/deannamessinger/ #Anne Marie Metzler #Teacher #Special Education #354-8230 #ametzler@pausd.org # #Challis Michael #Counselor #Guidance #354-8226 #cmichael@pausd.org # #Joanne Michels #Mental Health therapist #Wellness #354-8253 #jmichels@pausd.org # #Brian Miguel #Teacher #Social Studies #354-8237 #bmiguel@pausd.org # #Ahmed Mohmand #Aide #Special Education #354-8230 #amohmand@pausd.org # #Ginny Moyer #Teacher #English #354-8238 #vmoyer@pausd.org # #Julie Munger #Teacher #English #354-8238 #jmunger@pausd.org # #Lynne Navarro #Instructional Supervisor #Social Studies #354-8237 #lnavarro@pausd.org #https://sites.google.com/a/pausd.org/lynne-navarro/home #Vicky Niemann #Special Ed. Secretary #Special Education #354-8262 #vniemann@pausd.org # #Casey O'Connell #Teacher #Science #354-8246 #coconnell@pausd.org #https://sites.google.com/site/chemistryhonorsgunn/ #Dennis Ochoa #TRC Coordinator #Support Staff # #dochoa@pausd.org # #Kristen Owen #Teacher #English #354-8238 #kowen@pausd.org #https://sites.google.com/site/mrsowensclasswebsite/ #Jarrod Pagan #Attendance Clerk #Support Staff #354-8230 #jpagan@pausd.org # #Josh Paley #Teacher #Career Technical Education, Mathematics #354-8247 #jpaley@pausd.org #http://paleyontology.com/ #Jeff Patrick #Teacher #Social Studies #354-8237 #jpatrick@pausd.org # #Cecilia Peltier #Teacher #Mathematics #354-8247 #cpeltier@pausd.org # #Laurie Pennington #Instructional Supervisor, Teacher #Science #354-8246 #lpennington@pausd.org # #Cindy Peters #Instructional Supervisor, Teacher #Career Technical Education #354-8245 #cpeters@pausd.org # #Ken Plough #Teacher #Guidance #849-7961 #kplough@pausd.org # #Maria Powell #Teacher #Science #354-8246 #mpowell@pausd.org # #Samira Rastegar #Psychologist #Psychologist #354-8213 #srastegar@pausd.org # #Chris Redfield #Teacher #Mathematics #354-8247 #credfield@pausd.org #https://sites.google.com/a/pausd.org/mrredfieldmath/ #Daisy Renazco #Teacher, (ToSA) #Mathematics #354-8247 #drenazco@pausd.org #https://sites.google.com/site/renazcomath/ #Isabel Romo #Kitchen staff #Food Services #354-8233 #iromo@pausd.org # #Cora Ross #Counselor #Guidance #354-8290 #cross@pausd.org # #Richard Rullo #Teacher #Special Education #354-8230 #rrullo@pausd.org # #Kim Sabbag #Teacher #Physical Education #354-8215 #ksabbag@pausd.org # #Shirley Sachs #Secretary #Support Staff #354-8282 #ssachs@pausd.org # #Ernesto Salcedo #Custodian #Custodial #354-8205 #esalcedo@pausd.org # #Jorge Sanchez #Campus Supervisor #Support Staff #354-8288 #jsanchez@pausd.org # #Elizabeth Schnackenberg #Teacher #Special Education #354-8230 #eschnackenberg@pausd.org # #Claudia Schroeppel #Teacher #World Languages #354-8241 #cschroeppel@pausd.org # #Neeti Schworetzky #Teacher #Science #354-8246 #nschworetzky@pausd.org # #Jackie Selfridge #Teacher #Special Education #354-8230 #jselfridge@pausd.org # #Howard Selznick #Aide #Special Education #354-8250 #hselznick@pausd.org # #Jim Shelby #Teacher #Visual and Performing Arts #354-8258 #jshelby@pausd.org #http://www.gunntheatre.org/ #Tovah Skiles #Teacher #World Languages #354-8241 #tskiles@pausd.org # #Toni Smith #Teacher #Mathematics #354-8247 #tsmith@pausd.org # #Shayna Stebbins #Aide #Special Education #354-8230 #sstebbins@pausd.org # #Erin Stein-Wright #Behaviorist #Wellness #354-8251 #esteinwright@pausd.org # #Miriam Stevenson #Assistant Principal #Administration #354-8244 #mstevenson@pausd.org # #Pam Steward #Resource Specialist #Academic Center #354-8271 #psteward@pausd.org # #Todd Summers #Teacher #Visual and Performing Arts #354-8264 #tsummers@pausd.org #http://www.gunnmusic.org/ #Peggy Syvertson #Speech Therapist #Special Education #354-8230 #psyvertson@pausd.org # #Jessica Tabron #Department Secretary #Science, Social Studies #354-8237 #jtabron@pausd.org # #Lynn Tabuchi #TOSA, Inclusion #Special Education #354-8230 #ltabuchi@pausd.org # #Jeanette Tucker #Teacher #Special Education #354-8230 #jtucker@pausd.org # #Ariane Tuomy #Teacher #Social Studies #354-8237 #atuomy@pausd.org #https://sites.google.com/site/msrichardsportal/ #Nestor Vidonia #Custodian #Custodial #354-8205 #nvidonia@pausd.org # #Yanan Vrudny #Teacher #World Languages #354-8241 #yvrudny@pausd.org # #Lettie Weinmann #Teacher #Science #354-8246 #lweinmann@pausd.org #https://sites.google.com/a/pausd.org/weinmannphysics/ #Mark Weisman #Teacher #Social Studies #354-8237 #mweisman@pausd.org # #Jordan Wells #Teacher #English #354-8238 #jwells@pausd.org # #Heather Wheeler #Assistant Principal #Administration #354-8206 #hwheeler@pausd.org # #Tarn Wilson #Teacher #English #849-7930 #twilson@pausd.org # #Christina Woznicki #Teacher #Science #354-8246 #cwoznicki@pausd.org # #Sharon Yost #Teacher #Special Education #354-8250 #syost@pausd.org #https://sites.google.com/a/pausd.org/deaf-and-hard-of-hearing-high-school-program/ #Emily Yun #Teacher #Mathematics #354-8247 #eyun@pausd.org # #Myrna Zendejas #Social Worker #Special Programs #354-8230 #mzendejas@pausd.org # #Elana Zizmor #Teacher #Science #354-8246 #ezizmor@pausd.org #https://sites.google.com/a/pausd.org/zizmor-chem/ #"
        
        var arrayOfStaffStrings = stringOfStaffs.characters.split("#").map(String.init)
        
        var arrayOfStaffs : [Staff] = []
        
        for x in 0...arrayOfStaffStrings.count-1 {
            
//            func determineWebsite(website: String) -> String? {
//                if website == " " {
//                    return nil
//                } else {
//                    return website
//                }
//            }
            
            if (x % 6 == 5) {
                
                arrayOfStaffs.append(Staff(name: arrayOfStaffStrings[x-5],position: arrayOfStaffStrings[x-4],department: arrayOfStaffStrings[x-3],phoneNumber: arrayOfStaffStrings[x-2],email: arrayOfStaffStrings[x-1],website: arrayOfStaffStrings[x]))
                
            }
 
    
        }
        
        staffs += arrayOfStaffs
    }
    
    func getStaffs() -> [Staff] {
        loadStaffList()
        return staffs
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staffs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "StaffTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! StaffTableViewCell
        
        // Fetches the appropriate staff for the data source layout.
        let staff = staffs[indexPath.row]
        
        cell.staffName.text = staff.name
        cell.staffDepartment.text = staff.department
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        var destViewController = segue.destinationViewController as! StaffInfoViewController
        
        var thisStaff : Staff = staffs[indexPath.row]
        
        destViewController.thisStaff = thisStaff
        
        
        
    }
    
}
