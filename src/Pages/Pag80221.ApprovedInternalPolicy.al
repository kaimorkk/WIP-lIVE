

page 80221 "Approved Internal Policy"
{
    CardPageID = "Approved Internal Policy Card1";
    Editable = false;
    PageType = List;
    SourceTable = Policy;
    SourceTableView = where(Type = const(Internal),
                            "Approval Status" = const(Released));
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Name field.';
                }
                field(Summary; Rec.Summary)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Summary field.';
                }
                field("Applies-To"; Rec."Applies-To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-To field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsible Person"; Rec."Responsible Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Person field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Date Approved"; Rec."Date Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Approved field.';
                }
                field("Current Version No"; Rec."Current Version No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Version No field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

