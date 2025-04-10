

page 69451 "HSE Plan Section Details"
{
    CardPageID = "HSE Plan Section Detail";
    PageType = List;
    SourceTable = "HSE Plan Section Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Section Type"; Rec."Section Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Type field.';
                }
                field("Section Line No."; Rec."Section Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Line No. field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Indicator field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

