table 96005 "Licence Reg. Employment Hist"
{
    Caption = 'Employment History';
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
        field(3; Employer; Text[100])
        {
            Caption = 'Employer';
        }
        field(4; Designation; Text[100])
        {
            Caption = 'Designation';
        }
        field(5; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(6; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(7; "Currently Work Here"; Boolean)
        {
            Caption = 'Currently Work Here';
        }
        field(8; "Employment Type"; Option)
        {
            OptionMembers = ,Employed,"Self-Employed";
            OptionCaption = ',Employed,Self-Employed';
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        EmpHist.Reset();
        if EmpHist.FindLast() then
            Rec."Line No." := EmpHist."Line No." + 1
        else
            ReC."Line No." := 1
    end;

    var
        EmpHist: Record "Licence Reg. Employment Hist";
}
