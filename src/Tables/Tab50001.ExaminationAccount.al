#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 85025 "Examination Account"
{
    // DrillDownPageID = "Examination Accounts";
    // LookupPageID = "Examination Accounts";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Registration No."; Code[30])
        {
        }
        field(2; "Student Cust No."; Code[20])
        {
            TableRelation = Customer;
            Editable = true;

            trigger OnValidate()
            begin
                // if Customer.Get("Student Cust No.") then begin
                //     Name := Customer.Name;
                //     "First Name" := Customer.Name;
                //     // "Middle Name" := Customer."Middle Name";
                //     Surname := Customer."Last Name";
                //     Name := Customer.Name;
                //     Gender := Customer.Gender;
                //     // "ID No." := Customer."ID. No.";
                //     //"Registration Date":=TODAY;
                //     "Currency Code" := Customer."Currency Code";
                //     Address := Customer.Address;
                //     "Address 2" := Customer."Address 2";
                //     City := Customer.City;
                //     Validate(City);
                //     "Phone No." := Customer."Phone No.";
                //     Email := Customer."E-Mail";
                //     "Country/Region Code" := Customer."Country/Region Code";
                //     Validate("Country/Region Code");
                //     "Post Code" := Customer."Post Code";
                //     Validate("Post Code");

                // end;
            end;
        }
        field(3; "Course ID"; Code[30])
        {
            // TableRelation = Courses;

            trigger OnValidate()
            begin
                // if Courses.Get("Course ID") then begin
                //     "Course Description" := Courses.Description;
                // end;
            end;
        }
        field(4; "Course Description"; Text[100])
        {
        }
        field(5; "Current Examination Sitting"; Code[30])
        {
            // TableRelation = "Exam Sitting Cycle";
        }
        field(6; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(7; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(8; Surname; Text[30])
        {
            Caption = 'Surname';
        }
        field(9; "ID No."; Code[30])
        {
        }
        field(10; "Registration Date"; Date)
        {
        }
        field(11; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(12; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(13; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(14; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                // PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                // PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(15; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(16; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                // PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(17; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                // PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                // PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(18; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(19; Email; Text[80])
        {
        }
        field(20; "Blocked Start Date"; Date)
        {
        }
        field(21; "Blocked End Date"; Date)
        {
        }
        field(22; Blocked; Boolean)
        {
        }
        field(23; "Collection Date"; Date)
        {
        }
        field(24; "Collected By Name"; Text[100])
        {
        }
        field(25; "Collected By ID No."; Code[10])
        {
        }
        field(26; "Collected By Email"; Text[50])
        {
        }
        field(27; "Issued By Officer"; Code[30])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                // Employee.Reset;
                // Employee.SetRange("No.", "Issued By Officer");
                // if Employee.FindFirst then begin
                //     "Issued By Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name"
                // end
            end;
        }
        field(28; "Issued By Officer Name"; Text[100])
        {
            Editable = false;
        }
        field(29; "Certificate No."; Code[30])
        {
        }
        field(30; "Issued By User ID"; Code[30])
        {
            Editable = false;
            TableRelation = users;
        }
        field(31; "Renewal Pending"; Integer)
        {
        }
        field(32; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(33; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(34; "Last Renewal Date"; Date)
        {
        }
        field(35; Status; Option)
        {
            OptionCaption = 'Active,Inactive,Graduate,Deferred,Withdrawn,Dormant,Under Disciplinary';
            OptionMembers = Active,Inactive,Graduate,Deferred,Withdrawn,Dormant,"Under Disciplinary";
        }
        field(36; "Renewal Amount"; Decimal)
        {
        }
        field(37; "Re-Activation Amount"; Decimal)
        {
        }
        field(38; Name; Text[150])
        {
        }
        field(39; "Next Renewal Date"; Date)
        {
        }
        field(40; "Renewal Date L"; Date)
        {
            // CalcFormula = max("Student Renewal Entries"."Renewal Date" where("Course Id" = field("Course ID"),
            //   "Stud. Reg. No" = field("Registration No."),
            //   "Stud. Cust No." = field("Student Cust No.")));
            FieldClass = FlowField;
        }
        field(41; "Renewal Year"; Integer)
        {
            // CalcFormula = max("Student Renewal Entries".Year where("Course Id" = field("Course ID"),
            // "Stud. Reg. No" = field("Registration No."),
            // "Stud. Cust No." = field("Student Cust No.")));
            FieldClass = FlowField;
        }
        field(42; Transfered; Boolean)
        {
        }
        field(43; "Transfered By"; Code[30])
        {
        }
        field(44; "Transfer Date"; Date)
        {
        }
        field(45; "Status Remarks"; Text[30])
        {
        }
        field(46; Balance; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            //  CalcFormula = -sum("Detailed Customer Ledg. Entry".Amount where ("Customer No."=field("Student Cust No.")));
            Caption = 'Balance';
            Editable = false;
            // FieldClass = FlowField;
        }
        field(47; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            // CalcFormula = -sum("Detailed Customer Ledg. Entry"."Amount (LCY)" where ("Customer No."=field("Student Cust No.")));
            Caption = 'Balance (LCY)';
            Editable = false;
            // FieldClass = FlowField;
        }
        field(48; "No of Failed Papers"; Integer)
        {
            // CalcFormula = count("Exam Booking Entries" where(Status = filter(Failed),
            //                                                   Cancelled = filter(false),
            //                                                   "Student Reg No." = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(49; "No Of Booked Papers"; Integer)
        {
            // CalcFormula = count("Exam Booking Entries" where(Status = filter(Open),
            //                                                   "Student Reg No." = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(50; "No Of Exempted Papers"; Integer)
        {
            //   Deleted = filter(false)));
            FieldClass = FlowField; // CalcFormula = count("Exemption Entries" where("Stud. Reg. No" = field("Registration No."),
            //     
        }
        field(51; "Has Open Booking"; Boolean)
        {
            // CalcFormula = exist("Exam Booking Entries" where(Status = filter(Open),
            //                                                   "Student Reg No." = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(52; "Current Center"; Code[50])
        {
            // CalcFormula = lookup("Exam Booking Entries"."Exam Center" where(Status = filter(Open),
            //                                                                  "Student Reg No." = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(53; "Current Level"; Code[30])
        {
            // CalcFormula = lookup("Exam Booking Entries".Part where(Status = filter(Open),
            //                                                         "Student Reg No." = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(54; Cancelled; Boolean)
        {
        }
        field(55; "Cancelled By"; Code[30])
        {
        }
        field(56; "Cancellation Date"; Date)
        {
        }
        field(57; "Reason for Blocking"; Code[20])
        {
            // TableRelation = "Remarks Setup".Code;

            trigger OnValidate()
            begin
                // if RemarksSetup.Get("Reason for Blocking") then
                // "Blocking Remarks" := RemarksSetup.Description + '-' + UserId;
            end;
        }
        field(58; "Blocking Remarks"; Text[250])
        {
            Editable = false;
        }
        field(59; "Old Streamer"; Boolean)
        {
        }
        field(60; Issued; Boolean)
        {
        }
        field(61; Gender; Option)
        {
            OptionMembers = Male,Female,Other;
        }
        field(62; "Exemption Balance"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Registration No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        // "Last Date Modified":=TODAY;
        // "Last Modified Date Time":=CURRENTDATETIME;
    end;

    var
        PostCode: Record "Post Code";
        Customer: Record Customer;
        // Courses: Record Courses;
        Employee: Record Employee;
    // RemarksSetup: Record "Remarks Setup";
}

