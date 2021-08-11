CREATE TABLE cached (
                year INTEGER PRIMARY KEY,
                last_update TEXT,
                sha256 TEXT
            );
CREATE TABLE exploits (
                exploit_id INTEGER PRIMARY KEY,
                name TEXT,
                metasploit TEXT
            );
CREATE TABLE cves (
                cve_id TEXT PRIMARY KEY,
                cvss_v2 REAL,
                cvss_v3 REAL,
                published INTEGER
            );
CREATE TABLE products (
                product_id INTEGER PRIMARY KEY,
                vendor TEXT,
                product TEXT,
                version TEXT,
                version_update TEXT,
                UNIQUE (vendor, product, version, version_update)
            );
CREATE TABLE affected (
                cve_id TEXT,
                product_id INT,
                FOREIGN KEY (cve_id)
                    REFERENCES cves (cve_id),
                FOREIGN KEY (product_id)
                    REFERENCES products (product_id),
                PRIMARY KEY (cve_id, product_id)
            );
CREATE TABLE referenced (
                cve_id TEXT,
                exploit_id INTEGER,
                FOREIGN KEY (cve_id)
                    REFERENCES cves (cve_id),
                FOREIGN KEY (exploit_id)
                    REFERENCES exploits (exploit_id),
                PRIMARY KEY (cve_id, exploit_id)
            );
