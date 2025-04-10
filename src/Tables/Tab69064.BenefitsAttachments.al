
table 69064 "Benefits Attachments"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Benefit Category"; Integer)
        {
            TableRelation = "Benefits Matrix Setup"."Line No.";

            trigger OnValidate()
            begin
                BenefitsMatrixSetup.Reset;
                BenefitsMatrixSetup.SetRange("Line No.", "Benefit Category");
                if BenefitsMatrixSetup.FindFirst then begin
                    "Benefit Description" := BenefitsMatrixSetup."Benefit Description";
                end;
            end;
        }
        field(3; "Benefit Description"; Text[30])
        {
            Editable = false;
        }
        field(4; "Attachment Code"; Code[30])
        {
            TableRelation = "Attachment Setup";

            trigger OnValidate()
            begin
                AttachmentSetup.Reset;
                AttachmentSetup.SetRange(Code, "Attachment Code");
                if AttachmentSetup.FindFirst then begin
                    "Attachment Description" := AttachmentSetup."Attachment Description";
                end
            end;
        }
        field(5; "Attachment Description"; Text[30])
        {
            Editable = false;
        }
        field(6; "Attachment Type"; Option)
        {
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1; "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AttachmentSetup: Record "Attachment Setup";
        BenefitsMatrixSetup: Record "Benefits Matrix Setup";
}

