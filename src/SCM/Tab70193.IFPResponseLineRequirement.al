
table 70193 "IFP Response Line Requirement"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'IFP Response,EOI Response';
            OptionMembers = "IFP Response","EOI Response";
        }
        field(2; "Document No."; Code[20])
        {
            TableRelation = "RFI Response"."Document No.";

            trigger OnValidate()
            begin
                RFIResp.Reset;
                RFIResp.SetRange("Document No.", "Document No.");
                if RFIResp.FindSet then begin
                    "RFI Document No." := RFIResp."RFI Document No.";
                end;
            end;
        }
        field(3; "Procurement Category"; Code[50])
        {
            Description = 'Linked to RFI Prequalification Category Table. When the procurement category is selcted, the system shall validate the Procurement Category Description, Special Group Reservation, Unique Category Requirement, Restricted Responsibility Center ID, Prequalification Start Date and Prequalification ENd Date fields in the RFI Response Line table';
            TableRelation = "RFI Prequalification Category"."Prequalification Category ID" where("Document No" = field("RFI Document No."));
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Requirement Code"; Code[40])
        {
            TableRelation = "RFI Category Requirement"."Requirement Code";

            trigger OnValidate()
            begin
                RFIReq.Reset;
                RFIReq.SetRange("Requirement Code", "Requirement Code");
                if RFIReq.FindSet then begin
                    Description := RFIReq.Description;
                end;
            end;
        }
        field(6; Description; Text[250])
        {
        }
        field(7; "Requirement Type"; Option)
        {
            OptionCaption = ',Mandatory,Supporting';
            OptionMembers = ,Mandatory,Supporting;
        }
        field(8; "RFI Document No."; Code[30])
        {
            TableRelation = "Request For Information".Code;
        }
        field(9; "Meets Requirement"; Boolean)
        {
        }
        field(10; "Proof of compliance summary"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Procurement Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PrequalificationCategory: Record "RFI Prequalification Category";
        RFIResp: Record "RFI Response";
        RFIReq: Record "RFI Category Requirement";
}

