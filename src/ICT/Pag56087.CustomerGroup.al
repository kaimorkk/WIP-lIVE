

page 56087 "Customer Group"
{
    PageType = List;
    SourceTable = "Customer Group &  Mode";
    SourceTableView = where("Customer Group" = filter(true));

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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Customer Group"; Rec."Customer Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Group field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Customer Group" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Customer Group" := true;
    end;
}

#pragma implicitwith restore

