#Admin User
User.create(first_name: "Admin", last_name: "", password: "password", password_confirmation: "password", email: "admin@admin.com",
            admin: true, student_leader: true, recruiter: true, chief_of_staff: true, director: true, recruitment_head: true,
            recruitment_officer: true)

#Instrument Choices
Instrument.create(name: "Unknown")
Instrument.create(name: "Alto Sax")
Instrument.create(name: "Baritone")
Instrument.create(name: "Baritone Sax")
Instrument.create(name: "Bass")
Instrument.create(name: "Bass Guitar")
Instrument.create(name: "Bassoon")
Instrument.create(name: "BBD")
Instrument.create(name: "Big Ten Flags")
Instrument.create(name: "Cello")
Instrument.create(name: "Clarinet")
Instrument.create(name: "Drum Set")
Instrument.create(name: "Drumline")
Instrument.create(name: "Euphonium")
Instrument.create(name: "Flute")
Instrument.create(name: "French Horn")
Instrument.create(name: "Gold Dusters")
Instrument.create(name: "Golden Silks")
Instrument.create(name: "Guitar")
Instrument.create(name: "Harp")
Instrument.create(name: "Jazz Vocal")
Instrument.create(name: "Mellophone")
Instrument.create(name: "Oboe")
Instrument.create(name: "Percussion")
Instrument.create(name: "Piano")
Instrument.create(name: "Piccolo")
Instrument.create(name: "Solo Twirlers")
Instrument.create(name: "Sousaphone")
Instrument.create(name: "Tenor Sax")
Instrument.create(name: "Trombone")
Instrument.create(name: "Trumpet")
Instrument.create(name: "Tuba")
Instrument.create(name: "Viola")
Instrument.create(name: "Violin")

#Ensemble Choices
Ensemble.create(name: "Unknown")
Ensemble.create(name: "All")
Ensemble.create(name: "AAMB")
Ensemble.create(name: "Big Ten Flags")
Ensemble.create(name: "Concert")
Ensemble.create(name: "Golddusters")
Ensemble.create(name: "Golden Silks")
Ensemble.create(name: "Jazz")
Ensemble.create(name: "Orchestra")
Ensemble.create(name: "Percussion")
Ensemble.create(name: "Twirlers")

#Field Types
Group.create(name: "Address")
Group.create(name: "Text")
Group.create(name: "Option")

#Contact Types
ContactType.create(name: "Email")
ContactType.create(name: "Phone")
ContactType.create(name: "Web Inquiry")
ContactType.create(name: "Event")
ContactType.create(name: "Visit or Tour")
ContactType.create(name: "Postcard")
ContactType.create(name: "Other")

#Recruit Statuses
RecruitStatus.create(name: "N/A")
RecruitStatus.create(name: "No Answer")
RecruitStatus.create(name: "Still Undecided")
RecruitStatus.create(name: "Confirmed Yes [AAMB]")
RecruitStatus.create(name: "Confirmed Yes [AAMB] (Cut from Auditions)")
RecruitStatus.create(name: "Confirmed Yes [Concert]")
RecruitStatus.create(name: "Confirmed Yes [Jazz]")
RecruitStatus.create(name: "Not Interested in PU Bands")
RecruitStatus.create(name: "Not Attending Purdue")

#GDS Types
GdsType.create(name: "Fulltime")
GdsType.create(name: "Pregame")
GdsType.create(name: "Halftime")

#Fields
Field.create(name: "Gender", index: 0, group_id: 3, description: "", options: "Male\nFemale", hidden: false)
Field.create(name: "Home Phone", index: 1, group_id: 2, description: "[xxx.xxx.xxxx]", options: "", hidden: false, locked: true)
Field.create(name: "Cell Phone", index: 2, group_id: 2, description: "[xxx.xxx.xxxx]", options: "", hidden: false, locked: true)
Field.create(name: "Address", index: 3, group_id: 1, description: "", options: "", hidden: false, locked: true)
Field.create(name: "Major", index: 4, group_id: 2, description: "", options: "", hidden: false, locked: true)
Field.create(name: "Engineer", index: 5, group_id: 3, description: "", options: "Yes\nNo", hidden: false)
Field.create(name: "High School", index: 6, group_id: 2, description: "", options: "", hidden: false)
Field.create(name: "High School Grad Year", index: 7, group_id: 2, description: "", options: "", hidden: false, locked: true)
Field.create(name: "Contact", index: 8, group_id: 3, description: "", options: "Yes\nNo", hidden: false)
Field.create(name: "Parent Names", index: 9, group_id: 2, description: "", options: "", hidden: false)
Field.create(name: "Parent Address", index: 10, group_id: 1, description: "", options: "", hidden: false)
Field.create(name: "Parent Email", index: 11, group_id: 2, description: "", options: "", hidden: false)

#Officer Ranks
OfficerRank.create(name: "Bandsman", hours: 0, inventory: 0)
OfficerRank.create(name: "Private First Class", hours: 20, inventory: 0)
OfficerRank.create(name: "Corporal", hours: 40, inventory: 0)
OfficerRank.create(name: "Sergeant", hours: 60, inventory: 0)
OfficerRank.create(name: "Staff Sergeant", hours: 80, inventory: 0)
OfficerRank.create(name: "Sergeant First Class", hours: 100, inventory: 0)
OfficerRank.create(name: "Master Sergeant", hours: 120, inventory: 0)
OfficerRank.create(name: "First Sergeant", hours: 140, inventory: 0)
OfficerRank.create(name: "Sergeant Major", hours: 160, inventory: 0)
OfficerRank.create(name: "2nd Lieutenant", hours: 210, inventory: 0)
OfficerRank.create(name: "1st Lieutenant", hours: 265, inventory: 0)
OfficerRank.create(name: "Captain", hours: 325, inventory: 0)
OfficerRank.create(name: "Major", hours: 390, inventory: 0)
OfficerRank.create(name: "Lieutenant Colonel", hours: 460, inventory: 0)
OfficerRank.create(name: "Colonel", hours: 535, inventory: 0)

#Basic Ribbons
Ribbon.create(name: "1st Year Marcher", index: 1, description: "", hidden: false)
Ribbon.create(name: "2nd Year Marcher", index: 2, description: "", hidden: false)
Ribbon.create(name: "3rd Year Marcher", index: 3, description: "", hidden: false)
Ribbon.create(name: "4th Year Marcher", index: 4, description: "", hidden: false)
Ribbon.create(name: "5th Year Marcher", index: 5, description: "", hidden: false)
Ribbon.create(name: "6th Year Marcher", index: 6, description: "", hidden: false)
Ribbon.create(name: "Auxilaries", index: 7, description: "", hidden: false)
Ribbon.create(name: "Student Leader", index: 8, description: "", hidden: false)
Ribbon.create(name: "RoW", index: 9, description: "", hidden: false)
Ribbon.create(name: "Indy 500", index: 10, description: "", hidden: false)
Ribbon.create(name: "Indy 500 Stars", index: 11, description: "", hidden: false)
Ribbon.create(name: "Boiler Brass", index: 12, description: "", hidden: false)
Ribbon.create(name: "BB Star", index: 13, description: "", hidden: false)
Ribbon.create(name: "GABS", index: 14, description: "", hidden: false)
Ribbon.create(name: "GABS Star", index: 15, description: "", hidden: false)
Ribbon.create(name: "Box Band", index: 16, description: "", hidden: false)
Ribbon.create(name: "Box Band Star", index: 17, description: "", hidden: false)
Ribbon.create(name: "Orchestra", index: 18, description: "", hidden: false)
Ribbon.create(name: "Wind Ensemble", index: 19, description: "", hidden: false)
Ribbon.create(name: "Symphonic Band", index: 20, description: "", hidden: false)
Ribbon.create(name: "Concert Band", index: 21, description: "", hidden: false)
Ribbon.create(name: "Collegiate Band", index: 22, description: "", hidden: false)
Ribbon.create(name: "Varsity Band", index: 23, description: "", hidden: false)
Ribbon.create(name: "University Band", index: 24, description: "", hidden: false)
Ribbon.create(name: "Fall Concert Band", index: 25, description: "", hidden: false)
Ribbon.create(name: "Jazz/AMRE", index: 26, description: "", hidden: false)
Ribbon.create(name: "Brass Choir", index: 27, description: "", hidden: false)
Ribbon.create(name: "Percussion Ensemble", index: 28, description: "", hidden: false)
Ribbon.create(name: "Advancement", index: 29, description: "", hidden: false)
Ribbon.create(name: "Clothing", index: 30, description: "", hidden: false)
Ribbon.create(name: "Library", index: 31, description: "", hidden: false)
Ribbon.create(name: "Ops", index: 32, description: "", hidden: false)
Ribbon.create(name: "RR", index: 33, description: "", hidden: false)
Ribbon.create(name: "Supply", index: 34, description: "", hidden: false)
Ribbon.create(name: "Macy's", index: 35, description: "", hidden: false)

#Offices
Office.create(name: "-- No Office --", hidden: false)
Office.create(name: "Advancement", hidden: false)
Office.create(name: "Clothing", hidden: false)
Office.create(name: "Library", hidden: false)
Office.create(name: "Operations", hidden: false)
Office.create(name: "R&R", hidden: false)
Office.create(name: "Supply", hidden: false)
Office.create(name: "Technology", hidden: false)

#States
#
State.create([
  {
    name: "",
    abbreviation: ""
  },
  {
    name: "Alabama",
    abbreviation: "AL"
  },
  {
    name: "Alaska",
    abbreviation: "AK"
  },
  {
    name: "Arizona",
    abbreviation: "AZ"
  },
  {
    name: "Arkansas",
    abbreviation: "AR"
  },
  {
    name: "California",
    abbreviation: "CA"
  },
  {
    name: "Colorado",
    abbreviation: "CO"
  },
  {
    name: "Connecticut",
    abbreviation: "CT"
  },
  {
    name: "Delaware",
    abbreviation: "DE"
  },
  {
    name: "Florida",
    abbreviation: "FL"
  },
  {
    name: "Georgia",
    abbreviation: "GA"
  },
  {
    name: "Hawaii",
    abbreviation: "HI"
  },
  {
    name: "Idaho",
    abbreviation: "ID"
  },
  {
    name: "Illinois",
    abbreviation: "IL"
  },
  {
    name: "Indiana",
    abbreviation: "IN"
  },
  {
    name: "Iowa",
    abbreviation: "IA"
  },
  {
    name: "Kansas",
    abbreviation: "KS"
  },
  {
    name: "Kentucky",
    abbreviation: "KY"
  },
  {
    name: "Louisiana",
    abbreviation: "LA"
  },
  {
    name: "Maine",
    abbreviation: "ME"
  },
  {
    name: "Maryland",
    abbreviation: "MD"
  },
  {
    name: "Massachusetts",
    abbreviation: "MA"
  },
  {
    name: "Michigan",
    abbreviation: "MI"
  },
  {
    name: "Minnesota",
    abbreviation: "MN"
  },
  {
    name: "Mississippi",
    abbreviation: "MS"
  },
  {
    name: "Missouri",
    abbreviation: "MO"
  },
  {
    name: "Montana",
    abbreviation: "MT"
  },
  {
    name: "Nebraska",
    abbreviation: "NE"
  },
  {
    name: "Nevada",
    abbreviation: "NV"
  },
  {
    name: "New Hampshire",
    abbreviation: "NH"
  },
  {
    name: "New Jersey",
    abbreviation: "NJ"
  },
  {
    name: "New Mexico",
    abbreviation: "NM"
  },
  {
    name: "New York",
    abbreviation: "NY"
  },
  {
    name: "North Carolina",
    abbreviation: "NC"
  },
  {
    name: "North Dakota",
    abbreviation: "ND"
  },
  {
    name: "Ohio",
    abbreviation: "OH"
  },
  {
    name: "Oklahoma",
    abbreviation: "OK"
  },
  {
    name: "Oregon",
    abbreviation: "OR"
  },
  {
    name: "Pennsylvania",
    abbreviation: "PA"
  },
  {
    name: "Rhode Island",
    abbreviation: "RI"
  },
  {
    name: "South Carolina",
    abbreviation: "SC"
  },
  {
    name: "South Dakota",
    abbreviation: "SD"
  },
  {
    name: "Tennessee",
    abbreviation: "TN"
  },
  {
    name: "Texas",
    abbreviation: "TX"
  },
  {
    name: "Utah",
    abbreviation: "UT"
  },
  {
    name: "Vermont",
    abbreviation: "VT"
  },
  {
    name: "Virginia",
    abbreviation: "VA"
  },
  {
    name: "Washington",
    abbreviation: "WA"
  },
  {
    name: "West Virginia",
    abbreviation: "WV"
  },
  {
    name: "Wisconsin",
    abbreviation: "WI"
  },
  {
    name: "Wyoming",
    abbreviation: "WY"
  },
])
