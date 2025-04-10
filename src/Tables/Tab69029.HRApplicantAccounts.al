
table 69029 "HR Applicant Accounts"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
        }
        field(2; FirstName; Text[100])
        {
        }
        field(3; LastName; Text[100])
        {
        }
        field(4; Email; Text[100])
        {
        }
        field(5; Password; Text[100])
        {
        }
        field(6; Salt; Text[300])
        {
        }
        field(8; "Middle Name"; Text[50])
        {
        }
        field(10; Initials; Text[15])
        {
        }
        field(11; "Postal Address"; Text[80])
        {
        }
        field(12; City; Text[30])
        {
        }
        field(13; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(14; County; Text[30])
        {
        }
        field(15; "Cell Phone Number"; Text[30])
        {
        }
        field(16; Gender; Option)
        {
            OptionMembers = " ",Female,Male,Both;
        }
        field(17; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(18; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(19; "Ethnic Origin"; Text[50])
        {
            TableRelation = "Ethnic Background"."Ethnic group";
        }
        field(20; Disabled; Option)
        {
            OptionMembers = No,Yes," ";
        }
        field(21; "Date Of Birth"; Date)
        {

            trigger OnValidate()
            begin
                /*IF "Date Of Birth" >=TODAY THEN BEGIN
                    ERROR('Date of Birth cannot be after %1',TODAY);
                END;*/

            end;
        }
        field(22; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;

            trigger OnValidate()
            begin
                /*Country.RESET;
                Country.SETRANGE(Country.Code,Citizenship);
                IF Country.FIND('-') THEN
                BEGIN
                    "Citizenship Details":=Country.Name;
                END;*/

            end;
        }
        field(23; "Disability Details"; Text[250])
        {
        }
        field(24; "Disability Grade"; Text[30])
        {
        }
        field(25; Region; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(26; "PIN Number"; Code[20])
        {
            Caption = 'KRA PIN Number';
        }
        field(27; "Job Applied For"; Text[30])
        {
            Editable = false;
        }
        field(28; "Date Applied"; Date)
        {
        }
        field(29; "Citizenship Details"; Text[60])
        {
        }
        field(30; "Current Duties"; Text[300])
        {
            Caption = 'Current Duties,responsibilities and assignments';
        }
        field(32; "Abilites,Skills"; Text[300])
        {
        }
        field(33; NHIF; Text[30])
        {
        }
        field(34; NSSF; Text[30])
        {
        }
        field(35; "Alternative Email"; Text[30])
        {
        }
        field(36; "Current Employer"; Text[30])
        {
        }
        field(37; "Effective Date"; Date)
        {
        }
        field(38; "Position held"; Text[30])
        {
        }
        field(39; "Gross Salary"; Integer)
        {
        }
        field(40; Convicted; Boolean)
        {
        }
        field(41; "Conviction Description"; Text[250])
        {
        }
        field(42; Dismissal; Boolean)
        {
        }
        field(43; "Dismissal Description"; Text[250])
        {
        }
        field(44; "Disability Date"; Date)
        {
        }
        field(45; Religion; Text[30])
        {
        }
        field(46; "Altenative Phone Number"; Text[30])
        {
        }
        field(47; "Highest Education Level"; Text[50])
        {
        }
        field(48; "Expected Salary"; Decimal)
        {
        }
        field(49; "Details of Disability regist"; Text[250])
        {
        }
        field(50; "Work In All Centers"; Boolean)
        {
        }
        field(51; "ID Number"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

