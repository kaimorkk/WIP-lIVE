

page 75174 "IFP Response Line Requirement"
{
    PageType = List;
    SourceTable = "IFP Response Line Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Requirement Code"; Rec."Requirement Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFI Document No. field.';
                }
                field("Meets Requirement"; Rec."Meets Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meets Requirement field.';
                }
                field("Proof of compliance summary"; Rec."Proof of compliance summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proof of compliance summary field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

