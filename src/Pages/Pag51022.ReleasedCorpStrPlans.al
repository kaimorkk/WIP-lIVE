page 51022 "Released Corp Str Plans"
{
    CardPageID = "Corporate Strategic Plan Card";
    Caption = 'Released STAJ';
    Editable = false;
    PageType = List;
    SourceTable = "Corporate Strategic Plans";
    SourceTableView = where("Approval Status" = const(Released));
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Theme"; Rec."Primary Theme")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Theme field.';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
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
                field("Duration (Years)"; Rec."Duration (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration (Years) field.';
                }
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vision Statement field.';
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mission Statement field.';
                }
                field("Implementation Status"; Rec."Implementation Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Implementation Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore


