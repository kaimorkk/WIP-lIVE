
table 69108 "Job Application Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No"; Code[20])
        {
        }
        field(2; "First Name"; Text[100])
        {
        }
        field(3; "Middle Name"; Text[100])
        {
        }
        field(4; Surname; Text[10])
        {
        }
        field(5; Salutation; Option)
        {
            OptionMembers = Miss,Mrs,Mr,Doctor,Professor;
        }
        field(6; "ID/Passport"; Code[15])
        {
        }
        field(7; "Date of Birth"; Date)
        {
        }
        field(8; Age; Code[30])
        {
        }
        field(9; Gender; Option)
        {
            OptionMembers = Female,Male,Unknown;
        }
        field(10; "Marital Status"; Option)
        {
            OptionMembers = Single,Married,Divorced;
        }
        field(11; "Ethnic Origin"; Code[30])
        {
        }
        field(12; "Ethnic Origin Description"; Text[50])
        {
        }
        field(13; Email; Text[50])
        {
        }
        field(14; "Home Phone No."; Code[30])
        {
        }
        field(15; "Work Phone No."; Code[30])
        {
        }
        field(16; "Postal Code."; Code[30])
        {

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Postal Code.", County, "Country Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Postal Code.", County, "Country Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(17; "Postal Address"; Text[50])
        {
        }
        field(18; "Residential Address"; Text[50])
        {
        }
        field(19; City; Text[50])
        {

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Postal Code.", County, "Country Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Postal Code.", County, "Country Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(20; County; Text[50])
        {
        }
        field(21; "Country Code"; Code[30])
        {
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Postal Code.", County, "Country Code", xRec."Country Code");
            end;
        }
        field(22; "Country Name"; Text[50])
        {
            CalcFormula = lookup("Country/Region".Name where(Code = field("Country Code")));
            FieldClass = FlowField;
        }
        field(23; Citizenship; Text[50])
        {
        }
        field(24; Disabled; Boolean)
        {
        }
        field(25; "Disability Description"; Text[100])
        {
        }
        field(26; "Disability Grade"; Text[50])
        {
        }
        field(27; "Driving Licence"; Boolean)
        {
        }
        field(28; "Highest academic qualification"; Text[30])
        {
            TableRelation = Qualification;
        }
        field(29; "Current Job Position"; Text[100])
        {
        }
        field(30; "Current Duties and Responsibil"; Text[250])
        {
        }
        field(31; Hobbies; Text[100])
        {
        }
        field(32; "Vacancy Requisition No."; Code[30])
        {
            // TableRelation = "Vacancy  Requisitions Table";

            // trigger OnValidate()
            // begin
            //     VacancyRequisitionsLines.SetRange("Requisition No.", "Vacancy Requisition No.");
            //     if VacancyRequisitionsLines.FindSet then begin
            //         "Job Applied For" := VacancyRequisitionsLines."Job Description";
            //     end
            // end;
        }
        field(33; Shortlisted; Boolean)
        {
        }
        field(34; "Shortlisted On"; Date)
        {
        }
        field(35; "Shortlisted By"; Code[30])
        {
        }
        field(36; "Shortlisting Type"; Option)
        {
            OptionMembers = Oral,Written,Apptitude;
        }
        field(37; Qualified; Boolean)
        {
        }
        field(38; "Qualified By"; Code[30])
        {
        }
        field(39; "Quaified On"; Date)
        {
        }
        field(40; Status; Option)
        {
            OptionMembers = New,"Oral&Written",Apptitude,Closed;
        }
        field(41; "No. Series"; Code[30])
        {
        }
        field(42; "Application Date"; Date)
        {
        }
        field(43; Convicted; Boolean)
        {
        }
        field(44; "Job Applied For"; Text[100])
        {
            CalcFormula = lookup(Positions."Job Description" where("Job ID" = field("Job Id")));
            FieldClass = FlowField;
        }
        field(45; "Job Id"; Code[30])
        {
            TableRelation = Positions;
        }
        field(46; "Application Status"; Option)
        {
            OptionMembers = Submitted,"In-process",Shortlisted,Interview,Succesful;
        }
        field(47; "Names"; Text[1000])
        {
            // OptionMembers = Submitted,"In-process",Shortlisted,Interview,Succesful;
        }
    }

    keys
    {
        key(Key1; "Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        if "Application No" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Job Application Nos");
            NoSeriesMgt.InitSeries(HRSetup."Job Application Nos", xRec."No. Series", 0D, "Application No", "No. Series");
        end;
        "Application Date" := Today;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRJobs: Record Positions;
        // HREmployeeReq: Record "Employee Requisitions";
        userSetup: Record "User Setup";
        mDivision: Code[50];
        mResponsibility: Code[50];
        // CompanyJobsDimensions: Record "Staff Establishment Header";
        // VacancyRequisitionsLines: Record "Vacancy Requisition Lines";
        PostCode: Record "Post Code";
}

