#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 72123 "Operational Activities"
{
    PageType = ListPart;
    SourceTable = "Operational Activity";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Header No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
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
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("Overhead Budget"; Rec."Overhead Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overhead Budget field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

