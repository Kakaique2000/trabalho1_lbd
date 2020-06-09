  #!/bin/bash
    set -e
    set -x

    echo "******PostgreSQL initialisation******"
    pg_restore -d postgres /tmp/bd.backup