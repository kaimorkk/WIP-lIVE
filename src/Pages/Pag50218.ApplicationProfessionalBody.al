page 50218 "Application Professional Body"
{
    ApplicationArea = All;
    Caption = 'Professional Bodies';
    PageType = List;
    SourceTable = "Application Qualification";
    SourceTableView = where("Qualification Category" = filter("Proffessional Bodies"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Membership Type"; Rec."Membership Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Type field.';
                }
                field("Membership Registration No"; Rec."Membership Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
                field("Member Renewal Date"; Rec."Member Renewal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
                field("Licensing Number"; Rec."Licensing Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
                field("Licensing Renewal Date"; Rec."Licensing Renewal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Qualification Category" := Rec."qualification category"::"Proffessional Bodies";
    end;
}
