COL cont_open_time HEAD OPEN_TIME FOR A35

SELECT
    con_id                
  , dbid                  
--  , con_uid               
--  , guid                  
  , name                  
  , open_mode             
  , restricted            
  , open_time    cont_open_time
  , create_scn            
  , total_size            
  , block_size            
  , recovery_status       
  , snapshot_parent_con_id
FROM v$containers;

