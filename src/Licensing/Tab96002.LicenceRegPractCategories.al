table 96002 "Licence Reg. Pract. Categories"
{
    Caption = 'Licence Reg. Practice Categories';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Practice Category Code"; Code[50])
        {
            Caption = 'Practice Category Code';
            TableRelation = "Licence Practice Categories";
            Editable = false;

            trigger OnValidate()
            begin
                if Rec."Practice Category Code" = xRec."Practice Category Code" then exit;

                if "Practice Category Code" <> '' then begin
                    PCategories.Reset();
                    PCategories.SetRange(Code, "Practice Category Code");
                    if PCategories.FindFirst() then
                        Rec."Practice Category Name" := PCategories.Name;
                end else begin
                    Rec."Practice Category Name" := '';
                end;
            end;
        }
        field(4; "Practice Category Name"; Text[100])
        {
            Caption = 'Practice Category Name';
            Editable = false;
        }
        field(5; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(6; "Grounds for Removal"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Restore"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Licence No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Registration No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Renew; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Approve; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Practice Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Deregistered; Boolean)
        {
            Editable = false;
        }
        field(14; "Renewal Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Restoration Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.","Practice Category Code")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        RegPCategories.Reset();
        if RegPCategories.FindLast() then
            Rec."Line No." := RegPCategories."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        PCategories: Record "Licence Practice Categories";
        RegPCategories: Record "Licence Reg. Pract. Categories";
}
