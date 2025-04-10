#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 72122 "Budget Ceiling Line"
{
    PageType = ListPart;
    SourceTable = "Budget Ceiling Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Header No field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Fund Type"; Rec."Fund Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Type field.';
                }
                field("Routine Maintenance Amount(LCY"; Rec."Routine Maintenance Amount(LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Routine Maintenance Amount(LCY field.';
                }
                field("Periodic Maintenance Amount(LC"; Rec."Periodic Maintenance Amount(LC")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Periodic Maintenance Amount(LC field.';
                }
                field("Spot Improvement AMount(LCY)"; Rec."Spot Improvement AMount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Spot Improvement AMount(LCY) field.';
                }
                field("Structure Construction"; Rec."Structure Construction")
                {
                    ApplicationArea = Basic;
                    Caption = 'Structure Construction Amount(LCY)';
                    ToolTip = 'Specifies the value of the Structure Construction Amount(LCY) field.';
                }
                field("Rehabilitation Work"; Rec."Rehabilitation Work")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rehabilitation Work Amount(LCY)';
                    ToolTip = 'Specifies the value of the Rehabilitation Work Amount(LCY) field.';
                }
                field("New Construction"; Rec."New Construction")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Construction Amount(LCY)';
                    ToolTip = 'Specifies the value of the New Construction Amount(LCY) field.';
                }
                field("Total Budget(LCY)"; Rec."Total Budget(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget(LCY) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

