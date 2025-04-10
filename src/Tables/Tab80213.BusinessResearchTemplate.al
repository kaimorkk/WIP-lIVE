
table 80213 "Business Research Template"
{
    // DrillDownPageID = "Business Research Templates";
    // LookupPageID = "Business Research Templates";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[50])
        {

            trigger OnValidate()
            begin
                /* IF "Template ID" <> xRec."Template ID" THEN BEGIN
                       BRInnovationSetup.GET;
                        NoSeriesMgt.TestManual(BRInnovationSetup."BR Templates No. Series");
                       "No. Series" := '';
                    END;
                */

            end;
        }
        field(2; "Survey Type"; Code[50])
        {
            TableRelation = "Research Survey Type".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                if ResearchSurveyType.Get("Survey Type") then begin
                    "Business Research Category" := ResearchSurveyType."Business Research Category";
                    "Target Respondent Type" := ResearchSurveyType."Target Respondent Type";
                    "Primary Department" := ResearchSurveyType."Primary Department";
                    "Primary Directorate" := ResearchSurveyType."Primary Directorate";
                end;
            end;
        }
        field(3; "Business Research Category"; Option)
        {
            OptionCaption = 'Employee Survey,Stakeholder Survey ,Project Survey,Custom Survey';
            OptionMembers = "Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(4; Description; Text[50])
        {
        }
        field(5; "Target Respondent Type"; Option)
        {
            OptionCaption = 'Customers,Employees,Contacts,Vendors';
            OptionMembers = Customers,Employees,Contacts,Vendors;
        }
        field(6; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(7; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(8; Blocked; Boolean)
        {
        }
        field(15; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*
           IF "Template ID"= '' THEN BEGIN
              BRInnovationSetup.GET;
              BRInnovationSetup.TESTFIELD("BR Templates No. Series");
              NoSeriesMgt.InitSeries(BRInnovationSetup."BR Templates No. Series",xRec."No. Series",0D,"Template ID","No. Series");
           END;
        */

    end;

    var
        BRInnovationSetup: Record "e-BR & Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        ResearchSurveyType: Record "Research Survey Type";
}

