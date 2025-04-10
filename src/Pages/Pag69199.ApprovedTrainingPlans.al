

page 69199 "Approved Training Plans"
{
    CardPageID = "Approved Training Plan Header";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Training Plan Header";
    SourceTableView = where("Approved Status" = filter(Released));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Corporate Strategic Plan Code"; Rec."Corporate Strategic Plan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan Code field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Global; Rec.Global)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department  Name"; Rec."Department  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department  Name field.';
                }
                field("Approved Status"; Rec."Approved Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

