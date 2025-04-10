

page 95070 "Risk Status Rpt Inc. Impact"
{
    PageType = Card;
    SourceTable = "Risk Status Rpt Inc. Impact";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Line No."; Rec."Incident Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Impact Line No."; Rec."Impact Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Impact Type"; Rec."Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Category of Party Affected"; Rec."Category of Party Affected")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Employee No."; Rec."Internal Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Contact Details"; Rec."Contact Details")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

