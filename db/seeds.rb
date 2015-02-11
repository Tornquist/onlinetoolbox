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
Field.create(name: "High School Grad Year", index: 7, group_id: 2, description: "", options: "", hidden: false)
Field.create(name: "Contact", index: 8, group_id: 3, description: "", options: "Yes\nNo", hidden: false)
Field.create(name: "Parent Names", index: 9, group_id: 2, description: "", options: "", hidden: false)
Field.create(name: "Parent Address", index: 10, group_id: 1, description: "", options: "", hidden: false)
Field.create(name: "Parent Email", index: 11, group_id: 2, description: "", options: "", hidden: false)

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
