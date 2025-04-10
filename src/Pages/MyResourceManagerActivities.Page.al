Page 52193466 "My Resource Manager Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";

    layout
    {
        area(content)
        {
            cuegroup(Allocation)
            {
                Caption = 'Allocation';

                actions
                {
                    action(ResourceCapacity)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Resource Capacity';
                        Image = Capacity;
                        RunObject = Page "Resource Capacity";
                    }
                    action(ResourceGroupCapacity)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Resource Group Capacity';
                        RunObject = Page "Res. Group Capacity";
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
          Init;
          Insert;
        end;

        SetRange("Date Filter",WorkDate,WorkDate);
    end;
}

