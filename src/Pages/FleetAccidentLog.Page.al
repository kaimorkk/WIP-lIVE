Page 52194332 "Fleet Accident Log"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Accident Card";
    Editable = false;
    PageType = List;
    SourceTable = "Fleet Accident Log";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AccidentNo;"Accident No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccidentDescription;"Accident Description")
                {
                    ApplicationArea = Basic;
                }
                field(FixedAssetNo;"Fixed Asset No.")
                {
                    ApplicationArea = Basic;
                }
                field(FixedAssetName;"Fixed Asset Name")
                {
                    ApplicationArea = Basic;
                }
                field(DateofAccident;"Date of Accident")
                {
                    ApplicationArea = Basic;
                }
                field(CauseofAccident;"Cause of Accident")
                {
                    ApplicationArea = Basic;
                }
                field(DamageDescription;"Damage Description")
                {
                    ApplicationArea = Basic;
                }
                field(TotalOccupants;"Total Occupants")
                {
                    ApplicationArea = Basic;
                }
                field(OccupantsInjured;"Occupants Injured")
                {
                    ApplicationArea = Basic;
                }
                field(OccupantsKilled;"Occupants Killed")
                {
                    ApplicationArea = Basic;
                }
                field(ItemClassCode;"Item Class Code")
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

