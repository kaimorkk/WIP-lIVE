Page 52194044 "Over Staffed Establishments"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Company Jobs1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(JobDescription;"Job Description")
                {
                    ApplicationArea = Basic;
                }
                field(NoofPosts;"No of Posts")
                {
                    ApplicationArea = Basic;
                }
                field(OccupiedEstablishments;"Occupied Establishments")
                {
                    ApplicationArea = Basic;
                }
                field(Variance;Variance)
                {
                    ApplicationArea = Basic;
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
         if Find('-') then begin
          repeat
          CalcFields("Occupied Establishments");
          // MESSAGE('%1',"Occupied Position");
            "Vacant Establishments":="No of Posts"-"Occupied Establishments";
            Variance:="No of Posts"-"Occupied Establishments";
          Modify;
         until Next=0;
         end;
          Reset;
          SetCurrentkey("Vacant Establishments");
          SetFilter("Vacant Establishments",'<%1',0);
    end;
}

