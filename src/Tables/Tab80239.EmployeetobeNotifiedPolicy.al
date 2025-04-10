
table 80239 "Employee to be Notified-Policy"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Employee No"; Code[50])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.Find('-') then begin
                    "Employee Name" := Employee.FullName;
                    "Email Address" := Employee."E-Mail";
                end;

                BusinessResearchSurvey.Reset;
                BusinessResearchSurvey.SetRange("Document No.", "Document No.");
                if BusinessResearchSurvey.Find('-') then begin
                    "Policy Description" := BusinessResearchSurvey.Description;
                end;
            end;
        }
        field(3; "Employee Name"; Text[30])
        {
        }
        field(4; "Email Address"; Text[255])
        {
        }
        field(5; "Policy Description"; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        BusinessResearchSurvey: Record "Business Research Survey";
}

