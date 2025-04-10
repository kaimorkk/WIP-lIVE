
table 69726 "PreHire Medical Report"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Background Checks Inv No."; Code[30])
        {
            TableRelation = "Background Checks Header";

            trigger OnValidate()
            begin
                ChecksHeader.Reset;
                ChecksHeader.SetRange("Document No.", "Background Checks Inv No.");
                if ChecksHeader.FindFirst then begin
                    "Application No." := ChecksHeader."Application No.";
                    Description := ChecksHeader.Description;
                    "Vacancy ID" := ChecksHeader."Vacancy ID";
                    "Lead HR Officer" := ChecksHeader."Lead HR Officer";
                    "Candidate No." := ChecksHeader."Candidate No.";
                    "First Name" := ChecksHeader."First Name";
                    "Middle Name" := ChecksHeader."Middle Name";
                    "Last Name" := ChecksHeader."Last Name";

                end
            end;
        }
        field(3; "Application No."; Code[30])
        {
            Editable = false;
            TableRelation = "Job Applications";
        }
        field(4; Description; Text[300])
        {
        }
        field(5; "Medical Checks Template"; Code[30])
        {
            TableRelation = "Medical Checks Template"."Template ID";

            trigger OnValidate()
            begin
                MedicalChecksTemplateLine.Reset;
                MedicalChecksTemplateLine.SetRange("Template Id", "Medical Checks Template");
                if MedicalChecksTemplateLine.FindSet then begin
                    repeat
                        PrehireMedicalRep.Init;
                        PrehireMedicalRep."Line No." := PrehireMedicalRep."Line No." + 100;
                        PrehireMedicalRep."Medical History Type" := MedicalChecksTemplateLine."Medical History Type";
                        PrehireMedicalRep."Document No." := "Document No.";
                        PrehireMedicalRep.Code := MedicalChecksTemplateLine.Code;
                        PrehireMedicalRep.Description := MedicalChecksTemplateLine.Description;
                        PrehireMedicalRep.Insert(true);
                    until MedicalChecksTemplateLine.Next = 0
                end;
            end;
        }
        field(6; "Vacancy ID"; Code[30])
        {
            Editable = false;
            TableRelation = "Recruitment Requisition Header";
        }
        field(7; "Lead HR Officer"; Code[30])
        {
        }
        field(8; "Document Date"; Date)
        {
            Editable = false;
        }
        field(9; "Candidate No."; Code[10])
        {
            Editable = false;
        }
        field(10; "First Name"; Text[30])
        {
            Editable = false;
        }
        field(11; "Middle Name"; Text[30])
        {
            Editable = false;
        }
        field(12; "Last Name"; Text[30])
        {
            Editable = false;
        }
        field(13; "Doctor Name"; Text[100])
        {
        }
        field(14; Institution; Text[100])
        {
        }
        field(15; "Overall Medical Fitness"; Option)
        {
            OptionCaption = ' ,FIT FOR DUTY,UNFIT FOR DUTY,FIT AFTER FURTHER MEDICAL TREATMENT';
            OptionMembers = " ","FIT FOR DUTY","UNFIT FOR DUTY","FIT AFTER FURTHER MEDICAL TREATMENT";
        }
        field(16; "No. Series"; Code[10])
        {
        }
        field(17; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(18; "Created On"; DateTime)
        {
            Editable = false;
        }
        field(19; "Document Status"; Option)
        {
            OptionCaption = 'Open,Closed';
            OptionMembers = Open,Closed;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Prehire Medical Nos.");
        if "Document No." = '' then
            NoSeriesMgt.InitSeries(HumanResourcesSetup."Prehire Medical Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Document Date" := Today;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ChecksHeader: Record "Background Checks Header";
        MedicalChecksTemplateLine: Record "Medical Checks Template Line";
        PrehireMedicalRep: Record "Prehire Medical Report Lines";
}

