

page 69313 "Course Budget Allocation"
{
    PageType = ListPart;
    SourceTable = "Planning Line Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Type field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Service Item"; Rec."Service Item")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                field("Service Item Description"; Rec."Service Item Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item Description';
                    ToolTip = 'Specifies the value of the Vote Item Description field.';
                }
                field("Available Budget"; Rec."Available Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Available Budget field.';
                }
                field("Budget Utilized"; Rec."Budget Utilized")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Utilized field.';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Budget field.';
                }
                field("Planned Budget"; Rec."Planned Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Budget field.';
                }
                field("Planned No. to be Trained"; Rec."Planned No. to be Trained")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned No. to be Trained field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Planned Department"; Rec."Planned Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Department field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

