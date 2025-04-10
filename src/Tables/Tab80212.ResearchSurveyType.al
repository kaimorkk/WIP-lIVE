Table 80212 "Research Survey Type"
{
    // DrillDownPageID = "Research Survey Types";
    // LookupPageID = "Research Survey Types";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Business Research Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee Experience,Customer Experience,Project Survey,Custom Survey';
            OptionMembers = "Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(4; "Target Respondent Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Customers,Employees,Contacts,Vendors';
            OptionMembers = Customers,Employees,Contacts,Vendors;
        }
        field(5; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(6; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(2));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Directorate" := ResponsibilityCenter."Direct Reports To";
                end;
            end;
        }
        field(7; "No. of BR Templates"; Integer)
        {
            // CalcFormula = count("Business Research Template" where ("Survey Type"=field(Code)));
            FieldClass = FlowField;
        }
        field(8; "No. of BR Surveys"; Integer)
        {
            //CalcFormula = count("Business Research Survey" where ("Survey Type"=field(Code)));
            FieldClass = FlowField;
        }
        field(9; "No. of Survey Responses"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No. of BR Final Reports"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

