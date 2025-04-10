

page 75013 "PP Purchase Activity Schedule"
{
    PageType = List;
    SourceTable = "PP Purchase Activity Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PP Entry"; Rec."PP Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Days"; Rec."Planned Days")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Days"; Rec."Actual Days")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Dates"; Rec."Planned Dates")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Dates"; Rec."Actual Dates")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        PurchaseActivityPlanNo: Code[20];

        PurchaseActivityPlanNoVisible: Boolean;

        PurchaseActivityPlanLineNoVisible: Boolean;


    procedure SetPurchaseActivityNo(No: Code[20])
    begin
        PurchaseActivityPlanNo := No;
    end;


    procedure SetPurchaseActivityNoVisible(NewJobNoVisible: Boolean)
    begin
        PurchaseActivityPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetPurchaseActivityLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        PurchaseActivityPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}

#pragma implicitwith restore

