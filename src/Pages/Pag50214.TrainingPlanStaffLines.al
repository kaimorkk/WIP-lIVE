page 50214 "Training Plan Staff Lines"
{
    ApplicationArea = All;
    Caption = 'Training Plan Staff Lines';
    PageType = ListPart;
    SourceTable = "Training Plan Staff Lines";
    PopulateAllFields = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.', Comment = '%';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination field.', Comment = '%';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Days field.', Comment = '%';
                }
                field("Unit Amount"; Rec."Unit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Amount field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
            }
        }
    }
}
