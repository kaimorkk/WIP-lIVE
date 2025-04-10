page 69848 "Orientation Lines"
{
    Caption = 'Orientation Lines';
    PageType = ListPart;
    SourceTable = "Candidate Interview Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Orientation Date"; Rec."Interview Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Orientation Date field.';
                }
                field("Orientation Start Time"; Rec."Interview Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Orientation Start Time field.';
                }
                field("Orientation End Time"; Rec."Interview End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Orientation End Time field.';
                }
                field("Orientation Venue"; Rec."Interview Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Orientation Venue field.';
                }
                field("Room No."; Rec."Room No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Room No. field.';
                }
                field("Invitee Attendance Status"; Rec."Candidate Attendance Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Candidate Attendance Status field.';
                }
                field("Orientation Remarks"; Rec."Orientation Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Orientation Remarks field.';
                }
                field("Orientation Attendance Status"; Rec."Orientation Attendance Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Orientation Attendance Status field.';
                }


                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Birth Date field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport No. field.';
                }
                field("Tax Registration(PIN)"; Rec."Tax Registration(PIN)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Registration(PIN) field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("Ethnic Group"; Rec."Ethnic Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Group field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality field.';
                }
                field("Specialization Area"; Rec."Specialization Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialization Area field.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                }
                field("Academic Qualification Name"; Rec."Academic Qualification Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Academic Qualification Name field.';
                }
                field("Highest Academic Pointer"; Rec."Highest Academic Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Pointer field.';
                }
                field("General Work Experience Yrs"; Rec."General Work Experience Yrs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Work Experience Yrs field.';
                }
                field("Management Experience Yrs"; Rec."Management Experience Yrs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Experience Yrs field.';
                }
                field("Disability Code"; Rec."Disability Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Code field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Disability Description"; Rec."Disability Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Description field.';
                }
                field("Disability Cert No."; Rec."Disability Cert No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Cert No. field.';
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field("Notified On"; Rec."Notified On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified On field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Details)
            {
                action("Ability Test History")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Ability Test History action.';
                    trigger OnAction()
                    begin
                        Message('');
                    end;
                }
                action("Shortlisting History")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Shortlisting History action.';
                    trigger OnAction()
                    begin
                        Message('');
                    end;
                }
                action("Qualifications Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Qualifications Summary action.';
                    trigger OnAction()
                    begin
                        Message('');
                    end;
                }
            }
        }
    }
}

#pragma implicitwith restore

